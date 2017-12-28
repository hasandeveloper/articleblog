class Ability
  include CanCan::Ability

      #
      # :create = new, create
      # :read = index, show
      # :update = edit, update
      # :destroy = destroy
      # :manage = new, create, index, show, edit, update, destroy

    def initialize(user)
      if user.nil? # if the user is not logged in
          can :read, [Category, Article]
      elsif user.role? "admin"
          can :manage, [Category, Article, Review]
      elsif user.role? "moderator"
          can :read, [Category, Article, Review]
          can :create, Review
          #can :update, [Category, Product]
          can :destroy, Review
      elsif user.role? "author"
          can :create, [Category, Article]
          can :create, Review
          #can :update, [Category, Product]
          can :destroy, Review

        elsif user.role? "user"
          can :read, [Article, Category]
          can :create, [Article, Category]
          can [:update, :destroy], Article do |article|
            article.user_id == user.id
          end
          can [:read, :create], Review
          can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end
      
      end
    end
  end
