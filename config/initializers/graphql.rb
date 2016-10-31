CraftType = GraphQL::ObjectType.define do
  name "Craft"
  description "A craft"
  field :id, !types.ID
  field :name, !types.String
end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :craft do
    type CraftType
    argument :id, !types.ID
    description "Find a Craft by ID"
    resolve ->(obj, args, ctx) { Craft.find(args["id"]) }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end
