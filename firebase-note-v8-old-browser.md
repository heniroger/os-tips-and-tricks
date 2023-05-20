
## 🔥 Install firebase V8.10.1 For all old browsers
```
$ yarn add firebase@8.10.1
```
## 🔥 Add firebase.js file in webpack.config.js

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

## 🔥 Create firebase.js file and add this content
```js
// firebase.js

import { initializeApp } from 'firebase/app';
import { getMessaging } from 'firebase/messaging';

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
        apiKey: "AIzaSyBwtKumut3Kl6yW3O0RaZU",
        authDomain: "symfony-firebase-854b34.firebaseapp.com",
        projectId: "symfony-firebase-854b34",
        storageBucket: "symfony-firebase-854b34.appspot.com",
        messagingSenderId: "1062289678346",
        appId: "1:1062289678336:web:719132a02b3b248048b8k2",
        measurementId: "G-FG45E1B4ME"
};

const vapIdKey  = 'BPmDzvOQsY4FzHCC8NY_luLTyPdAA7_8oYuhLLvgzpBzegCs-Lqr9VtXgUALgb_aM';

const app = initializeApp(firebaseConfig);

const messaging = getMessaging(app);

export { messaging , vapIdKey };
```

## 🔥 Create custom-file.js file and add this content
Get the firebase token
```js

import { messaging } from './firebase';

messaging.getToken().then((token) => {
  console.log('FCM token: ${token}');
});

```

## 🔥 Update custom-file.js content 
- 🔥 Minimal content for **working example** 
```js

import { getToken } from 'firebase/messaging';
import { messaging, vapIdKey } from './firebase';


const requestPermission = () => {
        console.log('Requesting permission...');
        Notification.requestPermission().then((permission) => {
                if (permission === 'granted') {
                         console.log('Notification permission granted.');
                }
        }); 
}

requestPermission();
      

getToken(messaging,{ vapidKey: vapIdKey}).then((token) => {
  console.log(`FCM token: ${token}`);
});

```

- **Additional example:** Send the token to symfony controller
```js

import { getToken } from 'firebase/messaging';
import { messaging, vapIdKey } from './firebase';

const requestPermission = () => {
        console.log('Requesting permission...');
        Notification.requestPermission().then((permission) => {
                if (permission === 'granted') {
                         console.log('Notification permission granted.');
                }
        }); 
}

requestPermission();

getToken(messaging,{ vapidKey: vapIdKey}).then((token) => {
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
## 🔥 Create firebase-message-sw.js file /public directory

```js
// /public/firebase-message-sw.js


// Even if file is empty, you can get the firebase token  
//and save it to mysql database by sending request to the backend

```
## Additional example :Create background-custom-file.js and add this content 
Display notification 
```js
import { messaging } from './firebase';

messaging.onBackgroundMessage((payload) => {
  console.log('Received background message', payload);

  // Display a notification or perform some other action
  // ...
});

```

## 🔥 Update /assets/app.js file 
 Import custom-file.js and background-custom-file.js in app.js file
 
```js
// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.css';

// start the Stimulus application
import './bootstrap';

import './custom-file';
import './background-custom-file';
```

## 🔥 Run symfony app

```bash
$ symfony serve
$ yarn dev-server
```



## [Optional] Configuration

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

