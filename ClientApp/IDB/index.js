import { openDb } from "idb";

/*
    I did not bother too much about migrations and stuff.
    But in case if I had to, I'd make something like a hash of migrations:
    {
        testStore: {
            1 (version): function () { //a migrator function
            
            },
            2: function () { //the next function to migrate with
            
            }
        }
    }

    This would let me write migrations in a more contorllable way for every store independanlty and explicitely.

    I used to create, develop and support a big project with an IndexedDB in its heart, 
    and this pattern suited well enough.
*/

const DEFAULT_STORE = "dmsGoldenStash";

const dbmanager = {
    getDB() {
        return openDb('a99lvlWizard', 3, upgradedDB => {
            switch (upgradedDB.oldVersion) {
                case 1:
                    upgradedDB.deleteObjectStore(DEFAULT_STORE);
                    upgradedDB.createObjectStore(DEFAULT_STORE, {
                        keyPath: "uuid"
                    });
                    break;
                case 2:
                    upgradedDB.deleteObjectStore(DEFAULT_STORE);
                    upgradedDB.createObjectStore(DEFAULT_STORE, {
                        keyPath: "uuid"
                    });
                    break;
                default:
                    throw new Error("Unknown IDB version!");
                    break;
            }
        })
    },
    goldenStash: {
        async get(uuid) {
            const db = await dbmanager.getDB();
            return db.transaction(DEFAULT_STORE).objectStore(DEFAULT_STORE).get(uuid);
        },
        async set(record) {
            const db = await dbmanager.getDB();
            const transaction = db.transaction(DEFAULT_STORE, "readwrite");
            transaction.objectStore(DEFAULT_STORE).put(record);
            return transaction.complete;
        },
        async delete(uuid) {
            const db = await dbmanager.getDB();
            const transation = db.transaction(DEFAULT_STORE, "readwrite");
            transation.objectStore(DEFAULT_STORE).delete(uuid);
            return transation.complete;
        },
        async clear() {
            const db = await dbmanager.getDB();
            const transaction = db.transaction(DEFAULT_STORE, "readwrite");
            transaction.objectStore(DEFAULT_STORE).clear();
            return transaction.complete;
        },
        async all() {
            const db = await dbmanager.getDB();
            const transaction = db.transaction(DEFAULT_STORE);
            return transaction.objectStore(DEFAULT_STORE).getAll();
        },
        async allKeys() {
            const db = await dbmanager.getDB();
            const transaction = db.transaction(DEFAULT_STORE);
            return transaction.objectStore(DEFAULT_STORE).getAllKeys();
        }
    }
};

export default dbmanager;