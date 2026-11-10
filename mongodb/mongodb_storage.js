
// MongoDB storage assessment
// Run using mongosh.
// Reports deployment database sizes and collections
// in the currently selected database.

const adminDB = db.getSiblingDB("admin");
const currentDB = db.getName();

print("=== DATABASE STORAGE OVERVIEW ===");

const databaseList = adminDB.runCommand({
    listDatabases: 1,
    nameOnly: false
});

if (databaseList.ok === 1) {
    databaseList.databases.forEach(function (database) {
        printjson({
            database: database.name,
            sizeOnDiskBytes: database.sizeOnDisk,
            empty: database.empty
        });
    });
} else {
    print("Unable to retrieve database list.");
    printjson(databaseList);
}

print("=== COLLECTION STORAGE ===");
print("Selected database: " + currentDB);

db.getCollectionInfos().forEach(function (info) {
    if (info.type !== "collection") {
        return;
    }

    const stats = db.getCollection(info.name).stats();

    printjson({
        collection: info.name,
        documentCount: stats.count,
        logicalSizeBytes: stats.size,
        storageSizeBytes: stats.storageSize,
        totalIndexSizeBytes: stats.totalIndexSize,
        indexCount: stats.nindexes
    });
});
