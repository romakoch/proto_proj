// prisma/seed.ts

import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function seed() {
  // Create Manager
  const manager1 = await prisma.manager.create({
    data: {
      name: "Manager 1",
    },
  });

  const manager2 = await prisma.manager.create({
    data: {
      name: "Manager 2",
    },
  });

  // Create Creator
  const creator1 = await prisma.creator.create({
    data: {
      name: "Creator 1",
    },
  });

  const creator2 = await prisma.creator.create({
    data: {
      name: "Creator 2",
    },
  });

  // Create Customer
  const customer1 = await prisma.customer.create({
    data: {
      name: "Customer 1",
    },
  });

  const customer2 = await prisma.customer.create({
    data: {
      name: "Customer 2",
    },
  });

  // Create SalesChannel
  const salesChannel1 = await prisma.salesChannel.create({
    data: {
      name: "Sales Channel 1",
    },
  });

  const salesChannel2 = await prisma.salesChannel.create({
    data: {
      name: "Sales Channel 2",
    },
  });

  // Create TradePoint
  const tradePoint1 = await prisma.tradePoint.create({
    data: {
      code: 1,
      name: "Trade Point 1",
      dayCredit: 7,
      sumCredit: 1000,
      dayCreditSc: 10,
      sumCreditSc: 2000,
      dayCreditC: 14,
      sumCreditC: 3000,
      address: "Address 1",
      lat: "123.456",
      lng: "789.012",
      addressGeo: "Address Geo 1",
      lastVisitDate: new Date(),
      lastDeliveryDate: new Date(),
      customerId: customer1.id,
      salesChannelId: salesChannel1.id,
      managerId: manager1.id,
    },
  });

  const tradePoint2 = await prisma.tradePoint.create({
    data: {
      code: 2,
      name: "Trade Point 2",
      dayCredit: 14,
      sumCredit: 2000,
      dayCreditSc: 20,
      sumCreditSc: 3000,
      dayCreditC: 30,
      sumCreditC: 4000,
      address: "Address 2",
      lat: "456.789",
      lng: "012.345",
      addressGeo: "Address Geo 2",
      lastVisitDate: new Date(),
      lastDeliveryDate: new Date(),
      customerId: customer2.id,
      salesChannelId: salesChannel2.id,
      managerId: manager2.id,
    },
  });

  // Create Route
  const route1 = await prisma.route.create({
    data: {
      name: "Route 1",
      dateIn: new Date(),
      dateEnd: new Date(),
      managerId: manager1.id,
      creatorId: creator1.id,
      isDay1: 1,
      isDay2: 1,
      isDay3: 1,
      isDay4: 1,
      isDay5: 1,
      isDay6: 1,
      isDay7: 1,
    },
  });

  const route2 = await prisma.route.create({
    data: {
      name: "Route 2",
      dateIn: new Date(),
      dateEnd: new Date(),
      managerId: manager2.id,
      creatorId: creator2.id,
      isDay1: 0,
      isDay2: 0,
      isDay3: 0,
      isDay4: 0,
      isDay5: 0,
      isDay6: 0,
      isDay7: 0,
    },
  });

  const statusRouteDay1 = await prisma.statusRouteDay.create({
    data: {
      name: "RouteDay Status 1",
      orderBy: 1,
      accessName: "status1",
    },
  });

  const statusRouteDay2 = await prisma.statusRouteDay.create({
    data: {
      name: "RouteDay Status 1",
      orderBy: 1,
      accessName: "status1",
    },
  });

  // Create RouteDay
  const routeDay1 = await prisma.routeDay.create({
    data: {
      dateIn: new Date(),
      isOnlyOne: 1,
      dateStart: new Date(),
      dateEnd: new Date(),
      comment: "Comment 1",
      isUpdate: 0,
      routeId: 1,
      statusRouteDayId: statusRouteDay1.id,
      managerId: manager1.id,
    },
  });

  const routeDay2 = await prisma.routeDay.create({
    data: {
      dateIn: new Date(),
      isOnlyOne: 0,
      dateStart: new Date(),
      dateEnd: new Date(),
      comment: "Comment 2",
      isUpdate: 1,
      routeId: 2,
      statusRouteDayId: statusRouteDay2.id,
      managerId: manager2.id,
    },
  });

  // Create VisitStatus
  const visitStatus1 = await prisma.visitStatus.create({
    data: {
      name: "Visit Status 1",
      orderBy: 1,
      color: "blue",
      accessName: "status1",
    },
  });

  const visitStatus2 = await prisma.visitStatus.create({
    data: {
      name: "Visit Status 2",
      orderBy: 2,
      color: "green",
      accessName: "status2",
    },
  });

  // Create Visit
  const visit1 = await prisma.visit.create({
    data: {
      dateIn: new Date(),
      datePlan: new Date(),
      dateStart: new Date(),
      dateEnd: new Date(),
      orderBy: 1.5,
      isUpdate: 0,
      managerId: manager1.id,
      creatorId: creator1.id,
      tradePointId: 1,
      visitStatusId: visitStatus1.id,
      routeDayId: routeDay1.id,
    },
  });

  const visit2 = await prisma.visit.create({
    data: {
      dateIn: new Date(),
      datePlan: new Date(),
      dateStart: new Date(),
      dateEnd: new Date(),
      orderBy: 2.5,
      isUpdate: 0,
      managerId: manager2.id,
      creatorId: creator2.id,
      tradePointId: 2,
      visitStatusId: visitStatus2.id,
      routeDayId: routeDay2.id,
    },
  });

  // Create TypeOfTask
  const typeOfTask1 = await prisma.typeOfTask.create({
    data: {
      name: "Type of Task 1",
      orderBy: 1,
      accessName: "task1",
    },
  });

  const typeOfTask2 = await prisma.typeOfTask.create({
    data: {
      name: "Type of Task 2",
      orderBy: 2,
      accessName: "task2",
    },
  });

  // Create StatusTask
  const statusTask1 = await prisma.statusTask.create({
    data: {
      name: "Status Task 1",
      orderBy: 1,
      color: "red",
      accessName: "status1",
    },
  });

  const statusTask2 = await prisma.statusTask.create({
    data: {
      name: "Status Task 2",
      orderBy: 2,
      color: "yellow",
      accessName: "status2",
    },
  });

  // Create Task
  const task1 = await prisma.task.create({
    data: {
      name: "Task 1",
      description: "Description 1",
      datePlan: new Date(),
      visitId: visit1.id,
      managerId: manager1.id,
      statusTaskId: statusTask1.id,
      creatorId: creator1.id,
      typeOfTaskId: typeOfTask1.id,
    },
  });

  const task2 = await prisma.task.create({
    data: {
      name: "Task 2",
      description: "Description 2",
      datePlan: new Date(),
      visitId: visit2.id,
      managerId: manager2.id,
      statusTaskId: statusTask2.id,
      creatorId: creator2.id,
      typeOfTaskId: typeOfTask2.id,
    },
  });

  console.log("Seed data created successfully.");

  prisma.$disconnect();
}

seed().catch((e) => {
  console.error(e);
  process.exit(1);
});
