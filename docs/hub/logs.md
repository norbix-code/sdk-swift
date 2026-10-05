# HUB · Logs

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `disableLogging` | `PUT` | `/{version}/logs/disable` | `project` |
| `enableLogging` | `PUT` | `/{version}/logs/enable` | `project` |
| `deleteLoggingIntegration` | `DELETE` | `/{version}/logs/integrations/{Id}` | `project` |
| `disableLoggingIntegration` | `PUT` | `/{version}/logs/integrations/{Id}/disable` | `project` |
| `enableLoggingIntegration` | `PUT` | `/{version}/logs/integrations/{Id}/enable` | `project` |
| `getLoggingIntegration` | `GET` | `/{version}/logs/integrations/{id}` | `project` |
| `getLoggingIntegrations` | `GET` | `/{version}/logs/integrations` | `project` |
| `saveLoggingIntegration` | `POST` | `/{version}/logs/integrations` | `project` |
| `testLoggingIntegration` | `POST` | `/{version}/logs/integrations/test` | `project` |
