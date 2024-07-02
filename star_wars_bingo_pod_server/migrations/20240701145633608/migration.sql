BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bounty_hunter_raw" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "bounty_hunter_raw" USING btree ("userInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "droid" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "forceUserMasterId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "force_user_raw" (
    "id" bigserial PRIMARY KEY,
    "type" text NOT NULL,
    "name" text NOT NULL,
    "laserSaberId" bigint,
    "masterId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "hunter_hunted" (
    "id" bigserial PRIMARY KEY,
    "bountyHunterId" bigint NOT NULL,
    "forceUserId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "hunter_hunted_index_idx" ON "hunter_hunted" USING btree ("bountyHunterId", "forceUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "laser_saber" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "color" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "bounty_hunter_raw"
    ADD CONSTRAINT "bounty_hunter_raw_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "droid"
    ADD CONSTRAINT "droid_fk_0"
    FOREIGN KEY("forceUserMasterId")
    REFERENCES "force_user_raw"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "force_user_raw"
    ADD CONSTRAINT "force_user_raw_fk_0"
    FOREIGN KEY("laserSaberId")
    REFERENCES "laser_saber"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "force_user_raw"
    ADD CONSTRAINT "force_user_raw_fk_1"
    FOREIGN KEY("masterId")
    REFERENCES "force_user_raw"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "hunter_hunted"
    ADD CONSTRAINT "hunter_hunted_fk_0"
    FOREIGN KEY("bountyHunterId")
    REFERENCES "bounty_hunter_raw"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "hunter_hunted"
    ADD CONSTRAINT "hunter_hunted_fk_1"
    FOREIGN KEY("forceUserId")
    REFERENCES "force_user_raw"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR star_wars_bingo_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('star_wars_bingo_pod', '20240701145633608', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240701145633608', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
