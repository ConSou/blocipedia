class WikiPolicy < ApplicationPolicy

  class Scope
     attr_reader :user, :scope


     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user == nil
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private == false
             wikis << wiki
           end
         end
     elsif user.role == 'admin'
         wikis = scope.all
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.private == false || wiki.user == user || wiki.collaborators.include?(user)
             wikis << wiki
           end
         end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private == false || wiki.collaborators.include?(user)
             wikis << wiki
           end
         end
       end
       wikis 
     end
   end

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    edit?
  end

  def destroy?
    user.present? && user == record.user
  end


end
