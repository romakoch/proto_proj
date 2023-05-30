import "reflect-metadata";

import { Prisma, PrismaClient } from "@prisma/client";
import { ApolloServer, BaseContext } from "@apollo/server";
import { startStandaloneServer } from "@apollo/server/standalone";
import { resolvers } from "../prisma/generated/type-graphql";
import { buildSchema } from "type-graphql";

const prisma = new PrismaClient();

interface MyContext {
  prisma: PrismaClient;
}

const runGraphql = async () => {
  const schema = await buildSchema({
    resolvers,
    validate: false,
  });

  const graphqlserver = new ApolloServer<MyContext>({
    schema,
  });

  const { url } = await startStandaloneServer(graphqlserver, {
    context: async ({ req }) => ({ prisma }),
    listen: { port: 4000 },
  });
  console.log(`🚀 Server ready at: ${url}`);
};

runGraphql();
