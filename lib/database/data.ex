defmodule Data do

    # create some user data that is saved in the database
    def user_information() do
        %{
            username: "TestUser",
            lastname: "lastname",
        contact: %{
            email: "test@text.com",
            password: "password"
        },
        address: %{
            street: "Avanue 23",
            postal_code: "342895"
        }
    }
    end

    def query() do
        # connect to the database, create backend collection.
        {:ok, top} = Mongo.start_link(name: :mongo, database: "backend", pool_size: 2)

        # add the data into the database, then log the information.
        data = Mongo.insert_one(top, "users", user_information())
        IO.puts "#{inspect data}\n"

    end
end
