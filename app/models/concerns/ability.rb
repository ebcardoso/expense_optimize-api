class Ability
  include CanCan::Ability

  def initialize(user)
    permissions = Permission.select('permissions.*, resources.name AS resource_name, resources.type AS resource_type')
                            .joins(:resource, profile: [:user_profile])
                            .where(user_profile: { user_id: user.id })

    permissions.each do |permission|
      if permission.resource_name.to_sym == :todos &&
         permission.read? && permission.create? && permission.edit? && permission.exclude?
        can(:manage, :all)
      end
      resource = permission.resource_type.zero? ? permission.resource_name.to_sym : permission.resource_name.constantize
      permissions_array(permission).each do |action|
        can action.to_sym, resource
      end
    end
  end

  private

  def permissions_array(permission)
    [].tap do |permissions|
      permissions << 'read' if permission.read?
      permissions << 'create' if permission.create?
      permissions << 'update' if permission.edit?
      permissions << 'delete' if permission.exclude?
      permissions << 'manage' if permissions.size == 4
    end
  end
end
