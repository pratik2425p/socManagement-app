BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "society_document" ADD COLUMN "storagePath" text;
CREATE INDEX "society_document_society_idx" ON "society_document" USING btree ("societyId");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "tenant_noc" ADD COLUMN "documentPath" text;
ALTER TABLE "tenant_noc" ADD COLUMN "documentUrl" text;

--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261026191019002', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261026191019002', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260213194423028', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213194423028', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
