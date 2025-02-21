defmodule App.PlanetsTest do
  use App.DataCase

  alias App.{Repo, Planets}
  alias App.Planets.Planet

  setup do
    Repo.delete_all(Planet)  # Clears all planets before each test
    :ok
  end

  describe "list_planets" do
    setup do
      Repo.insert!(%Planet{id: 1, name: "A", distance: 1.0, orbital_period: 1.0})
      Repo.insert!(%Planet{id: 2, name: "B", distance: 2.0, orbital_period: 2.0})
      :ok
    end

    test "/0 returns all planets" do
      assert [%Planet{id: id1}, %Planet{id: id2}] = Planets.list_planets()
      assert id1 == 1
      assert id2 == 2
    end

    test "/1 lists planets sorted alphabetically" do
      assert [%Planet{name: "A"}, %Planet{name: "B"}] = Planets.list_planets(:sorted_by_name)
    end

    test "sorts planets by name ascending" do
      assert [%Planet{name: "A"}, %Planet{name: "B"}] =
               Planets.list_planets({:name, :asc})
    end

    test "sorts planets by name descending" do
      assert [%Planet{name: "B"}, %Planet{name: "A"}] =
               Planets.list_planets({:name, :desc})
    end

    test "sorts planets by orbital_period ascending" do
      assert [%Planet{orbital_period: 1.0}, %Planet{orbital_period: 2.0}] =
               Planets.list_planets({:orbital_period, :asc})
    end

    test "sorts planets by orbital_period descending" do
      assert [%Planet{orbital_period: 2.0}, %Planet{orbital_period: 1.0}] =
               Planets.list_planets({:orbital_period, :desc})
    end
  end


  test "create_planet/1 creates a planet with valid inputs" do
    assert [] = Planets.list_planets()
    Planets.create_planet(%{name: "A", distance: 1.0, orbital_period: 1.0})
    assert [%Planet{name: "A"}] = Planets.list_planets()
  end

  test "create_planet/1 does not create a planet with invalid inputs" do
    assert [] = Planets.list_planets()

    assert {:error,
            %Ecto.Changeset{
              valid?: false,
              errors: errors
            }} = Planets.create_planet(%{distance: -1.0, orbital_period: 0})

    assert [] = Planets.list_planets()

    assert {:name, {"can't be blank", _}} = List.keyfind(errors, :name, 0)
    assert {:distance, {"must be greater than %{number}", _}} = List.keyfind(errors, :distance, 0)

    assert {:orbital_period, {"must be greater than %{number}", _}} =
            List.keyfind(errors, :orbital_period, 0)
  end

  test "delete/1 deletes a planet struct" do
    planet = Repo.insert!(%Planet{id: 1, name: "B", distance: 1.0, orbital_period: 1.0})

    [planet] = Planets.list_planets()

    {:ok, planet} = Planets.delete_planet(planet)
    [] = Planets.list_planets()
  end

  # TODO uncomment and complete the following tests

  test "get/1 gets a planet by id" do
    planet = Repo.insert!(%Planet{id: 1, name: "Earth", distance: 1.0, orbital_period: 365.0})

    assert Planets.get_planet(planet.id) == planet
  end

  test "get/1 returns nil if no planet with the given id exists" do
    assert Planets.get_planet(-1) == nil
  end

  test "get_random_planet/1 gets a planet randomly" do
    planet1 = Repo.insert!(%Planet{name: "Earth", distance: 1.0, orbital_period: 365.0})
    planet2 = Repo.insert!(%Planet{name: "Mars", distance: 1.5, orbital_period: 687.0})

    assert Planets.get_random_planet() in [planet1, planet2]
  end

  test "update_planet/2 updates a planet struct with valid attrs" do
    planet = Repo.insert!(%Planet{name: "Mars", distance: 1.5, orbital_period: 687.0})

    {:ok, updated_planet} = Planets.update_planet(planet, %{name: "Red Planet"})

    assert updated_planet.name == "Red Planet"
    refute updated_planet.name == "Mars"
  end

  test "update_planet/2 doesn't update a planet struct with invalid attrs" do
    planet = Repo.insert!(%Planet{name: "Mars", distance: 1.5, orbital_period: 687.0})

    {:error, changeset} = Planets.update_planet(planet, %{orbital_period: -1.0})

    # Ensure the update fails
    assert changeset.valid? == false
  end
end
