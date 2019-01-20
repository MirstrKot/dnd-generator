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

    I used to create, develop and support a big project with an IndexedDB in its heart, 
    and this pattern suited well enough.
*/

const DEFAULT_STORE = "dmsGoldenStash";

const dbmanager = {
    getDB() {
        return openDb('a99lvlWizard', 1, upgradedDB => {
            upgradedDB.createObjectStore(DEFAULT_STORE, {
                keyPath: "id"
            });
        })
    },
    goldenStash: {
        async get(id) {
            const db = await dbmanager.getDB();
            return db.transaction(DEFAULT_STORE).objectStore(DEFAULT_STORE).get(id);
        },
        async set(record) {
            const db = await dbmanager.getDB();
            const transaction = db.transaction(DEFAULT_STORE, "readwrite");
            transaction.objectStore(DEFAULT_STORE).put(record);
            return transaction.complete;
        },
        async delete(id) {
            const db = await dbmanager.getDB();
            const transation = db.transaction(DEFAULT_STORE, "readwrite");
            transation.objectStore(DEFAULT_STORE).delete(id);
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