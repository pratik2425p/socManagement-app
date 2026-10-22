BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "building" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "name" text NOT NULL,
    "totalFloors" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "complaint" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "reportedByName" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "status" text NOT NULL,
    "assignedTo" text,
    "resolutionNotes" text,
    "createdAt" timestamp without time zone NOT NULL,
    "resolvedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "complex" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "address" text NOT NULL,
    "city" text NOT NULL,
    "pincode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "flat" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "buildingId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "floor" bigint NOT NULL,
    "squareFeet" double precision NOT NULL,
    "intercomNumber" text,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ledger_account" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "accountCode" text NOT NULL,
    "accountName" text NOT NULL,
    "accountType" text NOT NULL,
    "balance" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ledger_entry" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "entryNumber" text NOT NULL,
    "voucherId" bigint,
    "entryDate" timestamp without time zone NOT NULL,
    "description" text NOT NULL,
    "postedByName" text NOT NULL,
    "totalDebit" double precision NOT NULL,
    "totalCredit" double precision NOT NULL,
    "postedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "maintenance_bill" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "flatId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "billNumber" text NOT NULL,
    "billingMonth" text NOT NULL,
    "dueDate" timestamp without time zone NOT NULL,
    "amount" double precision NOT NULL,
    "lateFee" double precision NOT NULL,
    "status" text NOT NULL,
    "issuedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "maintenance_head" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "name" text NOT NULL,
    "chargeType" text NOT NULL,
    "rate" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notice" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "category" text NOT NULL,
    "priority" text NOT NULL,
    "postedByName" text NOT NULL,
    "postedAt" timestamp without time zone NOT NULL,
    "expiresAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "payment_record" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "billId" bigint NOT NULL,
    "flatId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "payerName" text NOT NULL,
    "amount" double precision NOT NULL,
    "paymentMethod" text NOT NULL,
    "transactionReference" text NOT NULL,
    "receiptNumber" text NOT NULL,
    "paymentDate" timestamp without time zone NOT NULL,
    "isVerified" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "code" text NOT NULL,
    "address" text NOT NULL,
    "city" text NOT NULL,
    "state" text NOT NULL,
    "pincode" text NOT NULL,
    "totalFlats" bigint NOT NULL,
    "subscriptionPlan" text NOT NULL,
    "subscriptionStatus" text NOT NULL,
    "complexId" bigint,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society_user" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "fullName" text NOT NULL,
    "phone" text NOT NULL,
    "email" text NOT NULL,
    "role" text NOT NULL,
    "flatNumber" text,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "visitor_entry" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "complexId" bigint,
    "flatNumber" text NOT NULL,
    "visitorName" text NOT NULL,
    "phoneNumber" text NOT NULL,
    "purpose" text NOT NULL,
    "vehicleNumber" text,
    "passcode" text,
    "status" text NOT NULL,
    "entryGate" text NOT NULL,
    "checkInTime" timestamp without time zone,
    "checkOutTime" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "voucher_request" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "voucherNumber" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "amount" double precision NOT NULL,
    "category" text NOT NULL,
    "requestedByName" text NOT NULL,
    "status" text NOT NULL,
    "rejectionReason" text,
    "approvedByName" text,
    "approvedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261022080503170', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261022080503170', "timestamp" = now();

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
