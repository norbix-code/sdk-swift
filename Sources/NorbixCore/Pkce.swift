import Foundation
#if canImport(CryptoKit)
import CryptoKit
#endif

/// A PKCE (RFC 7636, S256) verifier and its challenge for social sign-in and
/// link identity. Keep `codeVerifier` in memory (never in a URL); send
/// `codeChallenge` on the start (`socialSignInUrl(_:codeChallenge:)`,
/// `"codeChallenge"` on `startLinkIdentity`) and `codeVerifier` on the
/// exchange or the link finish (`"codeVerifier"`). A code started with a
/// challenge works only with the matching verifier: CM-ERRORS-MEMBERSHIP-058
/// otherwise, and the code is used up. A challenge that is not S256 is
/// CM-ERRORS-MEMBERSHIP-059.
public struct PkcePair: Sendable, Equatable {
    /// 43 characters `[A-Za-z0-9-_]`.
    public let codeVerifier: String
    /// base64url (no padding) SHA-256 of `codeVerifier`, 43 characters.
    public let codeChallenge: String

    /// A fresh verifier (32 bytes from the system's secure random source,
    /// base64url) and its S256 challenge.
    public static func create() -> PkcePair {
        var generator = SystemRandomNumberGenerator()
        let bytes = (0..<32).map { _ in UInt8.random(in: .min ... .max, using: &generator) }
        let verifier = Self.base64Url(Data(bytes))
        // A 32-byte verifier is always valid.
        return PkcePair(codeVerifier: verifier, codeChallenge: try! challenge(of: verifier))
    }

    /// The S256 challenge of a verifier: base64url (no padding) of SHA-256
    /// over its ASCII bytes. Throws for a verifier that is not 43–128
    /// characters of `A-Z a-z 0-9 - . _ ~`.
    public static func challenge(of codeVerifier: String) throws -> String {
        let allowed = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~")
        guard (43...128).contains(codeVerifier.count),
              codeVerifier.unicodeScalars.allSatisfy({ allowed.contains($0) }) else {
            throw NorbixError(
                message: "A PKCE code verifier is 43 to 128 characters of A-Z a-z 0-9 - . _ ~.",
                code: "NORBIX_PKCE_VERIFIER"
            )
        }
        return base64Url(Data(SHA256.hash(data: Data(codeVerifier.utf8))))
    }

    private static func base64Url(_ data: Data) -> String {
        data.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}
