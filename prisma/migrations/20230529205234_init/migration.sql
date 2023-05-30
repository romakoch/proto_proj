-- CreateTable
CREATE TABLE "Manager" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Manager_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Creator" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Creator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VisitStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "orderBy" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "accessName" TEXT NOT NULL,

    CONSTRAINT "VisitStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Visit" (
    "id" SERIAL NOT NULL,
    "dateIn" TIMESTAMP(3) NOT NULL,
    "datePlan" TIMESTAMP(3) NOT NULL,
    "dateStart" TIMESTAMP(3) NOT NULL,
    "dateEnd" TIMESTAMP(3) NOT NULL,
    "orderBy" DECIMAL(65,30) NOT NULL,
    "isUpdate" INTEGER NOT NULL,
    "managerId" INTEGER,
    "creatorId" INTEGER,
    "tradePointId" INTEGER,

    CONSTRAINT "Visit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TypeOfTask" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "orderBy" INTEGER NOT NULL,
    "accessName" TEXT NOT NULL,

    CONSTRAINT "TypeOfTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatusTask" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "orderBy" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "accessName" TEXT NOT NULL,

    CONSTRAINT "StatusTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskPrice" (
    "id" SERIAL NOT NULL,
    "brand" TEXT NOT NULL,
    "height" TEXT NOT NULL,
    "manufacturer" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "taskId" INTEGER,

    CONSTRAINT "TaskPrice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "datePlan" TIMESTAMP(3) NOT NULL,
    "visitId" INTEGER,
    "managerId" INTEGER,
    "statusTaskId" INTEGER NOT NULL,
    "creatorId" INTEGER,
    "typeOfTaskId" INTEGER,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Route" (
    "id" SERIAL NOT NULL,
    "managerId" INTEGER,
    "creatorId" INTEGER,

    CONSTRAINT "Route_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SalesChannel" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "SalesChannel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TradePoint" (
    "id" SERIAL NOT NULL,
    "code" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "dayCredit" INTEGER NOT NULL,
    "sumCredit" INTEGER NOT NULL,
    "dayCreditSc" INTEGER NOT NULL,
    "sumCreditSc" INTEGER NOT NULL,
    "dayCreditC" INTEGER NOT NULL,
    "sumCreditC" INTEGER NOT NULL,
    "address" TEXT NOT NULL,
    "lat" TEXT NOT NULL,
    "lng" TEXT NOT NULL,
    "addressGeo" TEXT NOT NULL,
    "lastVisitDate" TIMESTAMP(3) NOT NULL,
    "lastDeliveryDate" TIMESTAMP(3) NOT NULL,
    "customerId" INTEGER,
    "salesChannelId" INTEGER,
    "managerId" INTEGER,

    CONSTRAINT "TradePoint_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "Manager"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "Creator"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_tradePointId_fkey" FOREIGN KEY ("tradePointId") REFERENCES "TradePoint"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPrice" ADD CONSTRAINT "TaskPrice_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_visitId_fkey" FOREIGN KEY ("visitId") REFERENCES "Visit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "Manager"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_statusTaskId_fkey" FOREIGN KEY ("statusTaskId") REFERENCES "StatusTask"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "Creator"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_typeOfTaskId_fkey" FOREIGN KEY ("typeOfTaskId") REFERENCES "TypeOfTask"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Route" ADD CONSTRAINT "Route_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "Manager"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Route" ADD CONSTRAINT "Route_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "Creator"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TradePoint" ADD CONSTRAINT "TradePoint_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TradePoint" ADD CONSTRAINT "TradePoint_salesChannelId_fkey" FOREIGN KEY ("salesChannelId") REFERENCES "SalesChannel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TradePoint" ADD CONSTRAINT "TradePoint_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "Manager"("id") ON DELETE SET NULL ON UPDATE CASCADE;
