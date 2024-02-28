'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bc72d19bfa35ecb500411e184bbd1830",
"assets/AssetManifest.json": "335757bb7713f648fe87410fe0401be7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "3c192e01af3700e5cd090b24122ffe2a",
"assets/NOTICES": "54477a5f918e8de0434aed534828d3fb",
"assets/packages/beigi_portfolio/assets/images/blog.png": "383501168390c3833d9c81843c33d566",
"assets/packages/beigi_portfolio/assets/images/develop.png": "723c47f15273f7013cacb03032b547c2",
"assets/packages/beigi_portfolio/assets/images/learn.png": "7827c9e2366da4aaeec20a4342b76953",
"assets/packages/beigi_portfolio/assets/images/logo.png": "a9959a9aa0ceb0f5071458b353b39df2",
"assets/packages/beigi_portfolio/assets/images/person.png": "670d16c2b16cb94cd8ff3159fa909391",
"assets/packages/beigi_portfolio/assets/images/projects/1.jpeg": "323240fb1b1bf14fa7b4ed4d28abbca4",
"assets/packages/beigi_portfolio/assets/images/projects/2.jpeg": "8d95c6eb176a94d08d65b66cb5fab03e",
"assets/packages/beigi_portfolio/assets/images/projects/3.jpeg": "c9f588e4843b5cf7c6e614b4a17ee46c",
"assets/packages/beigi_portfolio/assets/images/projects/4.jpeg": "cce4265499da546fa4f19dafda74a277",
"assets/packages/beigi_portfolio/assets/images/projects/5.jpeg": "99aa5e4c06f65c1d5ad86c9db51e57bd",
"assets/packages/beigi_portfolio/assets/images/projects/6.jpeg": "563048f821e840ebdbc7000e9c6b834a",
"assets/packages/beigi_portfolio/assets/images/social/email-dark.png": "ed13e62563cec7b9f7fa081d9ae96be2",
"assets/packages/beigi_portfolio/assets/images/social/email.png": "7a97194d3c075caa1a2f2fb89f793d4e",
"assets/packages/beigi_portfolio/assets/images/social/github-dark.png": "3fd573d3afdcdb97acd6685367c7b254",
"assets/packages/beigi_portfolio/assets/images/social/github.png": "46fd5ca3c4a5cbcad97fd9b11d845f48",
"assets/packages/beigi_portfolio/assets/images/social/instagram-dark.png": "c5f26969de53635f18ce6012e937d046",
"assets/packages/beigi_portfolio/assets/images/social/instagram.png": "db9e28760b4c72ee51d5c2c7b0772823",
"assets/packages/beigi_portfolio/assets/images/social/linkedin-logo-dark.png": "c1d133bc27ed84e84050a55ed86d5456",
"assets/packages/beigi_portfolio/assets/images/social/linkedin-logo.png": "95e6c045dd5f8ea3ed14fc2de308d115",
"assets/packages/beigi_portfolio/assets/images/social/medium.png": "276ae11521896bd9a529e02aad79ff71",
"assets/packages/beigi_portfolio/assets/images/technology/c++.png": "8949bfc86fc10ef1505994eb643e940b",
"assets/packages/beigi_portfolio/assets/images/technology/css.png": "0d4d75245e18a852fe775fb0cf264852",
"assets/packages/beigi_portfolio/assets/images/technology/figma.png": "9109a878b5605cbabd228c63c817b006",
"assets/packages/beigi_portfolio/assets/images/technology/firebase.png": "d139ba1e59d9bcc1ed86617547dd51ee",
"assets/packages/beigi_portfolio/assets/images/technology/flask.png": "8615243e0ddaab150399cf0eca65a5ff",
"assets/packages/beigi_portfolio/assets/images/technology/flutter.png": "47e4c5ea380dc3b9241ee7b4f8b65c20",
"assets/packages/beigi_portfolio/assets/images/technology/git.png": "452bc8903a947cfb46e4581cb0b4d40c",
"assets/packages/beigi_portfolio/assets/images/technology/html.png": "18b1d25bf0de2147e65742e2f0aeebc7",
"assets/packages/beigi_portfolio/assets/images/technology/javascript.png": "5d1b82ec1260fed74d9a58961c29e1ad",
"assets/packages/beigi_portfolio/assets/images/technology/networkAdmin.png": "5bab0ce1412c48b840a9f175f5dfeece",
"assets/packages/beigi_portfolio/assets/images/technology/networkPlus.png": "69212bf6ffe01beb0836baf97baa2497",
"assets/packages/beigi_portfolio/assets/images/technology/php.png": "b187e3b1985b0aa738093d97ce028ab6",
"assets/packages/beigi_portfolio/assets/images/technology/python.png": "6606c48fbf49fc629449aa11170b8c1c",
"assets/packages/beigi_portfolio/assets/images/technology/razorpay.png": "368b761622d88029de7be2aadff6b7d3",
"assets/packages/beigi_portfolio/assets/images/technology/restAPI.png": "702d69f1e927b4218da90b3ac06422d5",
"assets/packages/beigi_portfolio/assets/images/technology/scenekit.jpeg": "dab8749c82628f14b8e5865b6a852cc3",
"assets/packages/beigi_portfolio/assets/images/technology/scrum.png": "e30c3d16f3c9fdf30db2545aa35f7f80",
"assets/packages/beigi_portfolio/assets/images/technology/swift.png": "6740f74615e8d2b6558d7d31fc7edb1e",
"assets/packages/beigi_portfolio/assets/images/technology/WP.png": "3c43a8d41f95c8dfd7c6ce7438dd91ed",
"assets/packages/beigi_portfolio/assets/svg/guy.svg": "384b0cd380b8ce087e170fe5b3dc7f6b",
"assets/packages/beigi_portfolio/assets/svg/person.svg": "00abbb5ba3e0acac159c8a7a664b7750",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cc79412f5ba2c910b37462be3ad03bc8",
"/": "cc79412f5ba2c910b37462be3ad03bc8",
"main.dart.js": "3bb8afaa89c031dd264ac0dfd9dc2cca",
"manifest.json": "9a0de1ff26661cd281cb9deb3db33b02",
"version.json": "c5fde143ab2a1e7bd25edde0de8509d1",
"web.zip": "f3c288bde8da51ea9869c0c249a9a9f3"};
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
