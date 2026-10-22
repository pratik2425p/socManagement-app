BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "meeting_minutes" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "meetingTitle" text NOT NULL,
    "meetingType" text NOT NULL,
    "meetingDate" timestamp without time zone NOT NULL,
    "agenda" text NOT NULL,
    "minutesSummary" text NOT NULL,
    "attendeesCount" bigint NOT NULL,
    "documentUrl" text,
    "recordedByName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_option" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "optionText" text NOT NULL,
    "votesCount" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_vote" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "voterName" text NOT NULL,
    "optionId" bigint NOT NULL,
    "votedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society_document" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "fileUrl" text NOT NULL,
    "fileSize" text NOT NULL,
    "uploadedByName" text NOT NULL,
    "isCommitteeOnly" boolean NOT NULL,
    "uploadedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society_poll" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "status" text NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "totalEligibleFlats" bigint NOT NULL,
    "totalVotesCast" bigint NOT NULL,
    "createdByName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "society_subscription" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "societyName" text NOT NULL,
    "tier" text NOT NULL,
    "flatCount" bigint NOT NULL,
    "ratePerFlat" double precision NOT NULL,
    "monthlyTotal" double precision NOT NULL,
    "billingCycle" text NOT NULL,
    "status" text NOT NULL,
    "nextRenewalDate" timestamp without time zone NOT NULL,
    "contactEmail" text NOT NULL,
    "contactPhone" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sos_alert" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "flatNumber" text NOT NULL,
    "raisedByName" text NOT NULL,
    "emergencyType" text NOT NULL,
    "description" text,
    "status" text NOT NULL,
    "acknowledgedByName" text,
    "acknowledgedAt" timestamp without time zone,
    "resolvedByName" text,
    "resolvedAt" timestamp without time zone,
    "resolutionNotes" text,
    "raisedAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261022083117648', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261022083117648', "timestamp" = now();

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
