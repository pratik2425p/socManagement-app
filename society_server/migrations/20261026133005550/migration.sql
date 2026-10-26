BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society_invitation" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "inviteeName" text NOT NULL,
    "phone" text NOT NULL,
    "email" text,
    "role" text NOT NULL,
    "occupancyType" text NOT NULL,
    "inviteCode" text NOT NULL,
    "status" text NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261026133005550', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261026133005550', "timestamp" = now();

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
