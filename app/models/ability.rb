class Ability
  include CanCan::Ability

  def initialize(user)

    if user.present?
      can :read, :all

      can :update, Company do |company|
        company.user == user
      end
      can :destroy, Company do |company|
        company.user == user
      end

      can :update, Truck do |truck|
        truck.user == user
      end
      can :destroy, Truck do |truck|
        truck.user == user
      end

      can :create, Company
      can :create, Truck
    end

  end
end
