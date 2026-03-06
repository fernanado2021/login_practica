# Flutter Push Notifications - Firebase Cloud Messaging (FCM)

Este proyecto es una aplicación móvil desarrollada en Flutter que integra notificaciones push utilizando Firebase Cloud Messaging (FCM). Permite recibir mensajes en tiempo real, manejar diferentes estados de la aplicación y mostrar notificaciones personalizadas.

## 🚀 Características

- ✅ Recepción de notificaciones push desde Firebase.
- ✅ Manejo de mensajes en primer plano (Foreground) mediante diálogos de alerta.
- ✅ Manejo de mensajes en segundo plano (Background) y cuando la app está cerrada (Terminated) mediante el sistema de notificaciones nativo.
- ✅ Solicitud dinámica de permisos para dispositivos Android 13+ e iOS.
- ✅ Obtención del Token de Dispositivo para envíos dirigidos.

## 🛠️ Requisitos e Instalación

### 1. Dependencias

Se han añadido las siguientes librerías en el archivo `pubspec.yaml`:

- `firebase_core`: Para la inicialización de Firebase.
- `firebase_messaging`: Para el manejo de los servicios de mensajería.

### 2. Configuración en Android

- Se agregó el permiso `POST_NOTIFICATIONS` en `android/app/src/main/AndroidManifest.xml`.
- El archivo `google-services.json` debe estar ubicado en `android/app/`.
- El `minSdkVersion` se configuró en `23` para mayor compatibilidad con las funciones de Firebase.

### 3. Implementación del Servicio

Se creó un servicio centralizado en `lib/push_notifications.dart` que se encarga de:

- Solicitar los permisos al usuario.
- Escuchar eventos de mensajería.
- Mostrar diálogos personalizados cuando la app está abierta.

## 📱 Cómo Realizar Pruebas

Para verificar que las notificaciones funcionan correctamente:

1. **Obtener el Token**:
   - Ejecuta la aplicación.
   - Revisa la consola de depuración (Debug Console) en VS Code.
   - Busca la línea: `Device Token: [TU_TOKEN_LAGO]`. Copia este código.

2. **Enviar desde Firebase Console**:
   - Entra a [Firebase Console](https://console.firebase.google.com/).
   - Ve a **Engage (Participación)** -> **Messaging**.
   - Haz clic en **Crear tu primera campaña** -> **Mensajes de Firebase Notification**.
   - Escribe un título y un mensaje.
   - Haz clic en **Enviar mensaje de prueba**, pega tu token y presiona **Probar**.

3. **Verificar Resultados**:
   - **App Abierta**: Aparecerá un cuadro de diálogo dentro de la aplicación.
   - **App en Segundo Plano/Cerrada**: Aparecerá una notificación en la barra superior del celular.

## 📂 Estructura del Código

- `lib/main.dart`: Inicialización de Firebase y configuración del Background Handler.
- `lib/push_notifications.dart`: Lógica principal de FCM y manejo de eventos.
- `android/app/src/main/AndroidManifest.xml`: Configuración de permisos nativos.

---

**Desarrollado como parte de la práctica de Notificaciones Push con Flutter.**
