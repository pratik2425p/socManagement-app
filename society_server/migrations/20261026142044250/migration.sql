BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "amenity" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "name" text NOT NULL,
    "icon" text NOT NULL,
    "capacity" bigint NOT NULL,
    "rate" double precision NOT NULL,
    "unit" text NOT NULL,
    "timeSlots" json NOT NULL,
    "description" text NOT NULL,
    "rules" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "amenity_society_idx" ON "amenity" USING btree ("societyId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "amenity_booking" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "amenityId" bigint NOT NULL,
    "amenityName" text NOT NULL,
    "flatNumber" text NOT NULL,
    "bookedById" bigint NOT NULL,
    "bookedByName" text NOT NULL,
    "bookingDate" timestamp without time zone NOT NULL,
    "slot" text NOT NULL,
    "amountPaid" double precision NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "amenity_booking_society_idx" ON "amenity_booking" USING btree ("societyId");
CREATE UNIQUE INDEX "amenity_booking_unique_slot_idx" ON "amenity_booking" USING btree ("societyId", "amenityId", "bookingDate", "slot");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "audit_log" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "category" text NOT NULL,
    "action" text NOT NULL,
    "actorId" bigint,
    "actorName" text NOT NULL,
    "actorRole" text NOT NULL,
    "target" text NOT NULL,
    "description" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "audit_log_society_timestamp_idx" ON "audit_log" USING btree ("societyId", "timestamp");
CREATE INDEX "audit_log_society_category_idx" ON "audit_log" USING btree ("societyId", "category");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tenant_noc" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "ownerName" text NOT NULL,
    "ownerPhone" text NOT NULL,
    "tenantName" text NOT NULL,
    "tenantPhone" text NOT NULL,
    "leaseStart" timestamp without time zone NOT NULL,
    "leaseEnd" timestamp without time zone NOT NULL,
    "monthlyRent" double precision NOT NULL,
    "nocNumber" text NOT NULL,
    "status" text NOT NULL,
    "resolutionNotes" text,
    "issuedAt" timestamp without time zone NOT NULL,
    "resolvedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "tenant_noc_society_flat_idx" ON "tenant_noc" USING btree ("societyId", "flatNumber");
CREATE INDEX "tenant_noc_society_status_idx" ON "tenant_noc" USING btree ("societyId", "status");


--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261026142044250', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261026142044250', "timestamp" = now();

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
