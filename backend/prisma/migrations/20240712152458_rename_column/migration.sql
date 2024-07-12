-- This is an empty migration.
CREATE TABLE "new_trips" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "destination" TEXT NOT NULL,
    "starts_at" DATETIME NOT NULL,
    "ends_at" DATETIME NOT NULL,
    "is_confirmed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO "new_trips" ("id", "destination", "starts_at", "ends_at", "is_confirmed", "created_at")
SELECT "id", "destination", "startts_at", "ends_at", "is_confirmed", "created_at" FROM "trips";

DROP TABLE "trips";

ALTER TABLE "new_trips" RENAME TO "trips";
