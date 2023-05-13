## Install firebase V9
```
$ yarn add firebase@9.21.0
```
## Add firebase.js file in webpack.config.js

```js
// webpack.config.js

const Encore = require('@symfony/webpack-encore');
const path = require('path');

Encore
  .setOutputPath('public/build/')
  .setPublicPath('/build')
  .addEntry('app', './assets/js/app.js')
  .addEntry('firebase', './assets/js/firebase.js')
  .enableSassLoader()
  .enablePostCssLoader()
  .enableSourceMaps(!Encore.isProduction())
  .cleanupOutputBeforeBuild()
  .enableBuildNotifications();

module.exports = Encore.getWebpackConfig();
```

## Create firebase.js file and add this content
```js
// firebase.js

import { initializeApp } from 'firebase/app';
import { getMessaging } from 'firebase/messaging';

const firebaseConfig = {
  // Your Firebase project configuration
};

initializeApp(firebaseConfig);

const messaging = getMessaging();

export { messaging };

```

## Create custom-file.js file and add this content
Get the firebase token
```js

import { messaging } from './firebase';

messaging.getToken().then((token) => {
  console.log('FCM token: ${token}');
});

```

## Update custome-file.js content 
Send the token to symfony controller
```js

import { messaging } from './firebase';

messaging.getToken().then((token) => {
  console.log(`FCM token: ${token}`);

  // Send the token to your Symfony application
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/fcm/register', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      console.log('FCM token registered:', xhr.responseText);
    }
  };
  xhr.send(JSON.stringify({ token: token }));
});

```
## Create background-custom-file.js and add this content 
Display notification 
```js
import { messaging } from './firebase';

messaging.onBackgroundMessage((payload) => {
  console.log('Received background message', payload);

  // Display a notification or perform some other action
  // ...
});

```

## Optional Configuration

```
$ npm install -g firebase-tools
```

```
$ firebase login
```

```
$ firebase init
```

```
$ firebase serve
```

