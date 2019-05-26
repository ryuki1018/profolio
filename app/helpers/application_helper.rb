module ApplicationHelper
    def item_nil
        if current_user.items == nil
            return true
        else
            return false
        end
    end
end
