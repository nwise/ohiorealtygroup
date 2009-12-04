module Admin::MenuItemsHelper

  def draw_menu_tree(menu_item)
    html = ''
    menu_item.children.each do |child|
      #html += "<li><a href='#{child.url}'>#{child.label}</a>"
      html += "<li>#{child.label}"
      html += link_to(image_tag('admin_icons/add.png'), new_admin_menu_item_path(:parent_id => child.id) ) 
      html += link_to(image_tag('admin_icons/edit.png'), edit_admin_menu_item_path(child)) 
      html += link_to(image_tag('admin_icons/delete.png'), admin_menu_item_path(child), 
                                                            :confirm => 'Are you sure?', 
                                                            :method => :delete)
      html += "</li>"
      unless child.children.empty?
        html += '<ul>' + draw_menu_tree(child) + '</ul>'        
      end
      html += '</li>'
    end
    return html
  end

end
