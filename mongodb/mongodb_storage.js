// Database and collection storage overview.
printjson(db.getSiblingDB("admin").runCommand({ listDatabases: 1 }).databases);
db.getCollectionNames().forEach(function (name) {
  const s = db.getCollection(name).stats();
  printjson({ collection: name, count: s.count, sizeBytes: s.size,
              storageSizeBytes: s.storageSize, indexSizeBytes: s.totalIndexSize });
});
