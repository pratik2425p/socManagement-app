BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "phone_otp" (
    "id" bigserial PRIMARY KEY,
    "phone" text NOT NULL,
    "salt" text NOT NULL,
    "otpHash" text NOT NULL,
    "attempts" bigint NOT NULL,
    "maxAttempts" bigint NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "lastSentAt" timestamp without time zone NOT NULL,
    "ipAddress" text,
    "isUsed" boolean NOT NULL
);

-- Indexes
CREATE INDEX "phone_otp_phone_idx" ON "phone_otp" USING btree ("phone");
CREATE INDEX "phone_otp_expires_idx" ON "phone_otp" USING btree ("expiresAt");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "society_user" ADD COLUMN "authUserId" text;
CREATE INDEX "society_user_phone_idx" ON "society_user" USING btree ("phone");
CREATE INDEX "society_user_auth_user_idx" ON "society_user" USING btree ("authUserId");

--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261026145558541', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261026145558541', "timestamp" = now();

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
