!function(e){function n(t){if(o[t])return o[t].exports;var r=o[t]={i:t,l:!1,exports:{}};return e[t].call(r.exports,r,r.exports,n),r.l=!0,r.exports}var o={};n.m=e,n.c=o,n.d=function(e,o,t){n.o(e,o)||Object.defineProperty(e,o,{configurable:!1,enumerable:!0,get:t})},n.n=function(e){var o=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(o,"a",o),o},n.o=function(e,n){return Object.prototype.hasOwnProperty.call(e,n)},n.p="/",n(n.s=0)}([function(e,n,o){e.exports=o(1)},function(e,n,o){"use strict";Object.defineProperty(n,"__esModule",{value:!0});var t=o(2),r=(o.n(t),o(3)),i=(o.n(r),o(4));r.Main.embed(document.getElementById("root")),Object(i.a)()},function(e,n){},function(e,n){throw new Error("Module build failed: Error: Compiler process exited with error Compilation failed\n-- NAMING ERROR - /Users/Student/CurrentProjects/randomApps/ElmRunner/src/Main.elm\n\nModule `Update` does not expose `clothingUrl`\n\n5| import Update exposing (update, Msg, getWeather, getClothing, clothingUrl)\n   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n\nDetected errors in 1 module.\n\n    at ChildProcess.<anonymous> (/Users/Student/.nvm/versions/node/v7.7.4/lib/node_modules/create-elm-app/node_modules/node-elm-compiler/index.js:141:27)\n    at emitTwo (events.js:106:13)\n    at ChildProcess.emit (events.js:194:7)\n    at maybeClose (internal/child_process.js:899:16)\n    at Socket.<anonymous> (internal/child_process.js:342:11)\n    at emitOne (events.js:96:13)\n    at Socket.emit (events.js:191:7)\n    at Pipe._handle.close [as _onclose] (net.js:513:12)")},function(e,n,o){"use strict";function t(){if("serviceWorker"in navigator){if(new URL("",window.location).origin!==window.location.origin)return;window.addEventListener("load",function(){var e="/service-worker.js";s?i(e):r(e)})}}function r(e){navigator.serviceWorker.register(e).then(function(e){e.onupdatefound=function(){var n=e.installing;n.onstatechange=function(){"installed"===n.state&&(navigator.serviceWorker.controller?console.log("New content is available; please refresh."):console.log("Content is cached for offline use."))}}}).catch(function(e){console.error("Error during service worker registration:",e)})}function i(e){fetch(e).then(function(n){404===n.status||-1===n.headers.get("content-type").indexOf("javascript")?navigator.serviceWorker.ready.then(function(e){e.unregister().then(function(){window.location.reload()})}):r(e)}).catch(function(){console.log("No internet connection found. App is running in offline mode.")})}n.a=t;var s=Boolean("localhost"===window.location.hostname||"[::1]"===window.location.hostname||window.location.hostname.match(/^127(?:\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/))}]);