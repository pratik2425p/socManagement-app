BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- Class Amenity as table amenity
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
-- Class AmenityBooking as table amenity_booking
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
-- Class AuditLog as table audit_log
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
-- Class Building as table building
--
CREATE TABLE "building" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "name" text NOT NULL,
    "totalFloors" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class Complaint as table complaint
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
-- Class Complex as table complex
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
-- Class Flat as table flat
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
-- Class LedgerAccount as table ledger_account
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
-- Class LedgerEntry as table ledger_entry
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
-- Class MaintenanceBill as table maintenance_bill
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
-- Class MaintenanceHead as table maintenance_head
--
CREATE TABLE "maintenance_head" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "name" text NOT NULL,
    "chargeType" text NOT NULL,
    "rate" double precision NOT NULL
);

--
-- Class MeetingMinutes as table meeting_minutes
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
-- Class Notice as table notice
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
-- Class PaymentRecord as table payment_record
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
-- Class PaymentTransaction as table payment_transaction
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
-- Class PhoneOtp as table phone_otp
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
-- Class PollOption as table poll_option
--
CREATE TABLE "poll_option" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "optionText" text NOT NULL,
    "votesCount" bigint NOT NULL
);

--
-- Class PollVote as table poll_vote
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
-- Class Society as table society
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
    "registrationNumber" text,
    "gstin" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class SocietyDocument as table society_document
--
CREATE TABLE "society_document" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "storagePath" text,
    "fileUrl" text NOT NULL,
    "fileSize" text NOT NULL,
    "uploadedByName" text NOT NULL,
    "isCommitteeOnly" boolean NOT NULL,
    "uploadedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "society_document_society_idx" ON "society_document" USING btree ("societyId");

--
-- Class SocietyInvitation as table society_invitation
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
-- Class SocietyPoll as table society_poll
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
-- Class SocietySubscription as table society_subscription
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
-- Class SocietyUser as table society_user
--
CREATE TABLE "society_user" (
    "id" bigserial PRIMARY KEY,
    "societyId" bigint NOT NULL,
    "authUserId" text,
    "fullName" text NOT NULL,
    "phone" text NOT NULL,
    "email" text NOT NULL,
    "role" text NOT NULL,
    "flatNumber" text,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "society_user_phone_idx" ON "society_user" USING btree ("phone");
CREATE INDEX "society_user_auth_user_idx" ON "society_user" USING btree ("authUserId");

--
-- Class SosAlert as table sos_alert
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
-- Class TenantNoc as table tenant_noc
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
    "resolvedAt" timestamp without time zone,
    "documentPath" text,
    "documentUrl" text
);

-- Indexes
CREATE INDEX "tenant_noc_society_flat_idx" ON "tenant_noc" USING btree ("societyId", "flatNumber");
CREATE INDEX "tenant_noc_society_status_idx" ON "tenant_noc" USING btree ("societyId", "status");

--
-- Class VisitorEntry as table visitor_entry
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
-- Class VoucherRequest as table voucher_request
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
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_time_idx" ON "serverpod_session_log" USING btree ("time");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class AnonymousAccount as table serverpod_auth_idp_anonymous_account
--
CREATE TABLE "serverpod_auth_idp_anonymous_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class AppleAccount as table serverpod_auth_idp_apple_account
--
CREATE TABLE "serverpod_auth_idp_apple_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userIdentifier" text NOT NULL,
    "refreshToken" text NOT NULL,
    "refreshTokenRequestedWithBundleIdentifier" boolean NOT NULL,
    "lastRefreshedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text,
    "isEmailVerified" boolean,
    "isPrivateEmail" boolean,
    "firstName" text,
    "lastName" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_apple_account_identifier" ON "serverpod_auth_idp_apple_account" USING btree ("userIdentifier");

--
-- Class EmailAccount as table serverpod_auth_idp_email_account
--
CREATE TABLE "serverpod_auth_idp_email_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_email" ON "serverpod_auth_idp_email_account" USING btree ("email");

--
-- Class EmailAccountPasswordResetRequest as table serverpod_auth_idp_email_account_password_reset_request
--
CREATE TABLE "serverpod_auth_idp_email_account_password_reset_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "emailAccountId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "challengeId" uuid NOT NULL,
    "setPasswordChallengeId" uuid
);

--
-- Class EmailAccountRequest as table serverpod_auth_idp_email_account_request
--
CREATE TABLE "serverpod_auth_idp_email_account_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" text NOT NULL,
    "challengeId" uuid NOT NULL,
    "createAccountChallengeId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_request_email" ON "serverpod_auth_idp_email_account_request" USING btree ("email");

--
-- Class FacebookAccount as table serverpod_auth_idp_facebook_account
--
CREATE TABLE "serverpod_auth_idp_facebook_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "fullName" text,
    "firstName" text,
    "lastName" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_facebook_account_user_identifier" ON "serverpod_auth_idp_facebook_account" USING btree ("userIdentifier");

--
-- Class FirebaseAccount as table serverpod_auth_idp_firebase_account
--
CREATE TABLE "serverpod_auth_idp_firebase_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "email" text,
    "phone" text,
    "userIdentifier" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_firebase_account_user_identifier" ON "serverpod_auth_idp_firebase_account" USING btree ("userIdentifier");

--
-- Class GitHubAccount as table serverpod_auth_idp_github_account
--
CREATE TABLE "serverpod_auth_idp_github_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "created" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_github_account_user_identifier" ON "serverpod_auth_idp_github_account" USING btree ("userIdentifier");

--
-- Class GoogleAccount as table serverpod_auth_idp_google_account
--
CREATE TABLE "serverpod_auth_idp_google_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "userIdentifier" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_google_account_user_identifier" ON "serverpod_auth_idp_google_account" USING btree ("userIdentifier");

--
-- Class MicrosoftAccount as table serverpod_auth_idp_microsoft_account
--
CREATE TABLE "serverpod_auth_idp_microsoft_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "created" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_microsoft_account_user_identifier" ON "serverpod_auth_idp_microsoft_account" USING btree ("userIdentifier");

--
-- Class PasskeyAccount as table serverpod_auth_idp_passkey_account
--
CREATE TABLE "serverpod_auth_idp_passkey_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "keyId" bytea NOT NULL,
    "keyIdBase64" text NOT NULL,
    "clientDataJSON" bytea NOT NULL,
    "attestationObject" bytea NOT NULL,
    "originalChallenge" bytea NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_passkey_account_key_id_base64" ON "serverpod_auth_idp_passkey_account" USING btree ("keyIdBase64");

--
-- Class PasskeyChallenge as table serverpod_auth_idp_passkey_challenge
--
CREATE TABLE "serverpod_auth_idp_passkey_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "challenge" bytea NOT NULL
);

--
-- Class RateLimitedRequestAttempt as table serverpod_auth_idp_rate_limited_request_attempt
--
CREATE TABLE "serverpod_auth_idp_rate_limited_request_attempt" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "domain" text NOT NULL,
    "source" text NOT NULL,
    "nonce" text NOT NULL,
    "ipAddress" text,
    "attemptedAt" timestamp without time zone NOT NULL,
    "extraData" json
);

-- Indexes
CREATE INDEX "serverpod_auth_idp_rate_limited_request_attempt_composite" ON "serverpod_auth_idp_rate_limited_request_attempt" USING btree ("domain", "source", "nonce", "attemptedAt");

--
-- Class SecretChallenge as table serverpod_auth_idp_secret_challenge
--
CREATE TABLE "serverpod_auth_idp_secret_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "challengeCodeHash" text NOT NULL
);

--
-- Class RefreshToken as table serverpod_auth_core_jwt_refresh_token
--
CREATE TABLE "serverpod_auth_core_jwt_refresh_token" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "extraClaims" text,
    "method" text NOT NULL,
    "fixedSecret" bytea NOT NULL,
    "rotatingSecretHash" text NOT NULL,
    "lastUpdatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "serverpod_auth_core_jwt_refresh_token_last_updated_at" ON "serverpod_auth_core_jwt_refresh_token" USING btree ("lastUpdatedAt");

--
-- Class UserProfile as table serverpod_auth_core_profile
--
CREATE TABLE "serverpod_auth_core_profile" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "imageId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_profile_user_profile_email_auth_user_id" ON "serverpod_auth_core_profile" USING btree ("authUserId");

--
-- Class UserProfileImage as table serverpod_auth_core_profile_image
--
CREATE TABLE "serverpod_auth_core_profile_image" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userProfileId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "url" text NOT NULL
);

--
-- Class ServerSideSession as table serverpod_auth_core_session
--
CREATE TABLE "serverpod_auth_core_session" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUsedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone,
    "expireAfterUnusedFor" bigint,
    "sessionKeyHash" bytea NOT NULL,
    "sessionKeySalt" bytea NOT NULL,
    "method" text NOT NULL
);

--
-- Class AuthUser as table serverpod_auth_core_user
--
CREATE TABLE "serverpod_auth_core_user" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_anonymous_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_anonymous_account"
    ADD CONSTRAINT "serverpod_auth_idp_anonymous_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_apple_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_apple_account"
    ADD CONSTRAINT "serverpod_auth_idp_apple_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account_password_reset_request" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_0"
    FOREIGN KEY("emailAccountId")
    REFERENCES "serverpod_auth_idp_email_account"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_1"
    FOREIGN KEY("challengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_2"
    FOREIGN KEY("setPasswordChallengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account_request" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_0"
    FOREIGN KEY("challengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_1"
    FOREIGN KEY("createAccountChallengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_facebook_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_facebook_account"
    ADD CONSTRAINT "serverpod_auth_idp_facebook_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_firebase_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_firebase_account"
    ADD CONSTRAINT "serverpod_auth_idp_firebase_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_github_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_github_account"
    ADD CONSTRAINT "serverpod_auth_idp_github_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_google_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_google_account"
    ADD CONSTRAINT "serverpod_auth_idp_google_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_microsoft_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_microsoft_account"
    ADD CONSTRAINT "serverpod_auth_idp_microsoft_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_passkey_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_passkey_account"
    ADD CONSTRAINT "serverpod_auth_idp_passkey_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_jwt_refresh_token" table
--
ALTER TABLE ONLY "serverpod_auth_core_jwt_refresh_token"
    ADD CONSTRAINT "serverpod_auth_core_jwt_refresh_token_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_profile" table
--
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_1"
    FOREIGN KEY("imageId")
    REFERENCES "serverpod_auth_core_profile_image"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_profile_image" table
--
ALTER TABLE ONLY "serverpod_auth_core_profile_image"
    ADD CONSTRAINT "serverpod_auth_core_profile_image_fk_0"
    FOREIGN KEY("userProfileId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_session" table
--
ALTER TABLE ONLY "serverpod_auth_core_session"
    ADD CONSTRAINT "serverpod_auth_core_session_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


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
