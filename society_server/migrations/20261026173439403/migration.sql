BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "payment_transaction" (
    "id" bigserial PRIMARY KEY,
    "orderId" text NOT NULL,
    "billId" bigint NOT NULL,
    "societyId" bigint NOT NULL,
    "userId" bigint,
    "amount" double precision NOT NULL,
    "amountPaise" bigint NOT NULL,
    "currency" text NOT NULL,
    "status" text NOT NULL,
    "razorpayPaymentId" text,
    "razorpaySignature" text,
    "receiptNumber" text,
    "idempotencyKey" text,
    "failureReason" text,
    "isProcessed" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "payment_tx_order_id_idx" ON "payment_transaction" USING btree ("orderId");
CREATE INDEX "payment_tx_bill_id_idx" ON "payment_transaction" USING btree ("billId");
CREATE INDEX "payment_tx_society_id_idx" ON "payment_transaction" USING btree ("societyId");
CREATE INDEX "payment_tx_payment_id_idx" ON "payment_transaction" USING btree ("razorpayPaymentId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "society" ADD COLUMN "registrationNumber" text;
ALTER TABLE "society" ADD COLUMN "gstin" text;

--
-- MIGRATION VERSION FOR society
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('society', '20261026173439403', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261026173439403', "timestamp" = now();

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
