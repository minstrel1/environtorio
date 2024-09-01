gui_utils = {}

gui_utils.add_titlebar = function (gui, caption, close_button_name)
    local titlebar = gui.add{type = "flow"}
    titlebar.drag_target = gui
    titlebar.add{
      type = "label",
      style = "frame_title",
      caption = caption,
      ignored_by_interaction = true,
    }
    local filler = titlebar.add{
      type = "empty-widget",
      style = "draggable_space",
      ignored_by_interaction = true,
    }
    filler.style.height = 24
    filler.style.horizontally_stretchable = true
    titlebar.add{
      type = "sprite-button",
      name = close_button_name,
      style = "frame_action_button",
      sprite = "utility/close_white",
      hovered_sprite = "utility/close_black",
      clicked_sprite = "utility/close_black",
      tooltip = {"gui.close-instruction"},
    }
end

return gui_utils