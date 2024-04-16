$env.config = {
  show_banner: false,
  completions: {
    algorithm: "fuzzy"
  }

  menus: [
    {
      name: completion_menu
      only_buffer_difference: false
      marker: "| "
      type: {
        layout: ide
        min_completion_width: 0,
        max_completion_width: 50,
        max_completion_height: 10, # will be limited by the available lines in the terminal
        padding: 0,
        border: true,
        cursor_offset: 0,
        description_mode: "prefer_right"
        min_description_width: 0
        max_description_width: 50
        max_description_height: 10
        description_offset: 1
        correct_cursor_pos: false
      }
      style: {
        text: green
        selected_text: { attr: r }
        description_text: yellow
        match_text: { attr: u }
        selected_match_text: { attr: ur }
      }
    }
  ]
}
