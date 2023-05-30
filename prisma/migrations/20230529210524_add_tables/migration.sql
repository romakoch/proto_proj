/*
  Warnings:

  - Added the required column `dateEnd` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dateIn` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay1` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay2` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay3` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay4` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay5` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay6` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isDay7` to the `Route` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Route` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Route" ADD COLUMN     "dateEnd" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "dateIn" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "isDay1" INTEGER NOT NULL,
ADD COLUMN     "isDay2" INTEGER NOT NULL,
ADD COLUMN     "isDay3" INTEGER NOT NULL,
ADD COLUMN     "isDay4" INTEGER NOT NULL,
ADD COLUMN     "isDay5" INTEGER NOT NULL,
ADD COLUMN     "isDay6" INTEGER NOT NULL,
ADD COLUMN     "isDay7" INTEGER NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Visit" ADD COLUMN     "routeDayId" INTEGER,
ADD COLUMN     "visitStatusId" INTEGER;

-- CreateTable
CREATE TABLE "StatusRouteDay" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "orderBy" INTEGER NOT NULL,
    "accessName" TEXT NOT NULL,

    CONSTRAINT "StatusRouteDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RouteDay" (
    "id" SERIAL NOT NULL,
    "dateIn" TIMESTAMP(3) NOT NULL,
    "isOnlyOne" INTEGER NOT NULL,
    "dateStart" TIMESTAMP(3) NOT NULL,
    "dateEnd" TIMESTAMP(3) NOT NULL,
    "comment" TEXT NOT NULL,
    "isUpdate" INTEGER NOT NULL,
    "routeId" INTEGER,
    "statusRouteDayId" INTEGER,
    "managerId" INTEGER,

    CONSTRAINT "RouteDay_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_visitStatusId_fkey" FOREIGN KEY ("visitStatusId") REFERENCES "VisitStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_routeDayId_fkey" FOREIGN KEY ("routeDayId") REFERENCES "RouteDay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RouteDay" ADD CONSTRAINT "RouteDay_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "Route"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RouteDay" ADD CONSTRAINT "RouteDay_statusRouteDayId_fkey" FOREIGN KEY ("statusRouteDayId") REFERENCES "StatusRouteDay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RouteDay" ADD CONSTRAINT "RouteDay_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "Manager"("id") ON DELETE SET NULL ON UPDATE CASCADE;
