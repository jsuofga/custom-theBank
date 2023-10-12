'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "95343786f559905da1adc6f008b135dd",
"assets/AssetManifest.json": "dcaf0cb242cbee4909229305f12191bb",
"assets/assets/andmt_logo.png": "b9d71653a6000489aad6fd6624c8c073",
"assets/assets/bank_logo.png": "67ec92446935f24205c8f6be8c25b131",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7563189a892b3bd0f64aa36e4ae1d4d2",
"assets/NOTICES": "b2f1e4c461aefaa378b6d4bfebcf1893",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "c054c7813708ce6fa65ddbbbe786395b",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/127b6420": "f544885c613c38088a31bc204910f395",
"icons/1948cdbc": "f544885c613c38088a31bc204910f395",
"icons/1c4122c5": "f544885c613c38088a31bc204910f395",
"icons/246716e8": "f544885c613c38088a31bc204910f395",
"icons/2f5b76a5": "f544885c613c38088a31bc204910f395",
"icons/34021918": "f544885c613c38088a31bc204910f395",
"icons/3b5de02": "f544885c613c38088a31bc204910f395",
"icons/43ae8ba1": "f544885c613c38088a31bc204910f395",
"icons/44f92594": "f544885c613c38088a31bc204910f395",
"icons/465d94f5": "f544885c613c38088a31bc204910f395",
"icons/477b594d": "f544885c613c38088a31bc204910f395",
"icons/4aab55a4": "f544885c613c38088a31bc204910f395",
"icons/5233907": "f544885c613c38088a31bc204910f395",
"icons/612ecfcd": "f544885c613c38088a31bc204910f395",
"icons/688b7837": "f544885c613c38088a31bc204910f395",
"icons/6d9f91b3": "f544885c613c38088a31bc204910f395",
"icons/6fb09d72": "f544885c613c38088a31bc204910f395",
"icons/7db6d37f": "f544885c613c38088a31bc204910f395",
"icons/7dd5bc38": "f544885c613c38088a31bc204910f395",
"icons/823c76ab": "f544885c613c38088a31bc204910f395",
"icons/85eba4f9": "f544885c613c38088a31bc204910f395",
"icons/8692914d": "f544885c613c38088a31bc204910f395",
"icons/884059f4": "f544885c613c38088a31bc204910f395",
"icons/8abafadb": "f544885c613c38088a31bc204910f395",
"icons/8ce2861": "f544885c613c38088a31bc204910f395",
"icons/8f71462f": "f544885c613c38088a31bc204910f395",
"icons/8fe9d58c": "f544885c613c38088a31bc204910f395",
"icons/958b367a": "f544885c613c38088a31bc204910f395",
"icons/9981f0a4": "f544885c613c38088a31bc204910f395",
"icons/aab240ac": "f544885c613c38088a31bc204910f395",
"icons/ab62efa4": "f544885c613c38088a31bc204910f395",
"icons/apple-touch-icon.png": "f544885c613c38088a31bc204910f395",
"icons/bee321a": "f544885c613c38088a31bc204910f395",
"icons/c287d379": "f544885c613c38088a31bc204910f395",
"icons/c7659dce": "f544885c613c38088a31bc204910f395",
"icons/c7f979db": "f544885c613c38088a31bc204910f395",
"icons/ca6977c1": "f544885c613c38088a31bc204910f395",
"icons/cb065475": "f544885c613c38088a31bc204910f395",
"icons/cb82ed47": "f544885c613c38088a31bc204910f395",
"icons/cbc54043": "f544885c613c38088a31bc204910f395",
"icons/d655a4cc": "f544885c613c38088a31bc204910f395",
"icons/dc0a73fe": "f544885c613c38088a31bc204910f395",
"icons/dc6a609b": "f544885c613c38088a31bc204910f395",
"icons/dd7b4a89": "f544885c613c38088a31bc204910f395",
"icons/dfa5de06": "f544885c613c38088a31bc204910f395",
"icons/e00117c6": "f544885c613c38088a31bc204910f395",
"icons/e1bc2530": "f544885c613c38088a31bc204910f395",
"icons/e291d89f": "f544885c613c38088a31bc204910f395",
"icons/e69f674e": "f544885c613c38088a31bc204910f395",
"icons/f4d20e36": "f544885c613c38088a31bc204910f395",
"icons/f6693d9f": "f544885c613c38088a31bc204910f395",
"icons/fe749678": "f544885c613c38088a31bc204910f395",
"icons/ff15f19e": "f544885c613c38088a31bc204910f395",
"icons/Icon-192.png": "721d03bb5ddbeb67b4f2694c82152cba",
"icons/Icon-512.png": "48c91533c7a4bc610e72b9bc4d83f702",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b1ba829921fc9276fe4d43221b64eaa3",
"/": "b1ba829921fc9276fe4d43221b64eaa3",
"main.dart.js": "9c892a45e2f5a7e76a7ec2ad07651757",
"manifest.json": "104e40fa7f209e21c1868beaaf2d783b",
"version.json": "693937be6f1235b228a88df38cb469d1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
