{ inputs, ... }: {
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = false;

    autostart_sh = ''
      noctalia &
    '';

    settings = {
      monitorrule = [
        "name:^eDP-1$,width:1920,height:1080,refresh:60.02,scale:1.25"
        "name:^HDMI-A-2$,width:1366,height:768,refresh:59.79,scale:1"
      ];

      # Window effects
      blur = 0;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params = {
        num_passes = 2;
        radius = 5;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.2;
      };

      # Window shadows
      shadows = 0;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadowscolor = "0x000000ff";

      border_radius = 0;
      no_radius_when_single = 0;
      focused_opacity = 1.0;
      unfocused_opacity = 1.0;

      # Animation Configuration (support type: zoom, slide)
      # tag_animation_direction: 1-horizontal, 0-vertical
      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 1;

      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;

      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;

      animation_duration = {
        move = 500;
        open = 400;
        tag = 350;
        close = 800;
        focus = 0;
      };

      animation_curve = {
        open = "0.46,1.0,0.29,1";
        move = "0.46,1.0,0.29,1";
        tag = "0.46,1.0,0.29,1";
        close = "0.08,0.92,0,1";
        focus = "0.46,1.0,0.29,1";
        opafadeout = "0.5,0.5,0.5,0.5";
        opafadein = "0.46,1.0,0.29,1";
      };

      # Scroller Layout Setting
      scroller = {
        structs = 20;
        default_proportion = 0.8;
        focus_center = 0;
        prefer_center = 0;
        default_proportion_single = 1.0;
        proportion_preset = "0.5,0.8,1.0";
      };

      edge_scroller = {
        pointer_focus = 1;
        focus_allow_speed = 0.0;
      };

      # Master-Stack Layout Setting
      new_is_master = 0;
      default_mfact = 0.5;
      default_nmaster = 1;
      tag_num = 9;
      smartgaps = 0;

      # Dwindle Layout Setting
      dwindle = {
        smart_split = 0;
        drop_simple_split = 1;
        manual_split = 0;
        hsplit = 1;
        vsplit = 1;
        preserve_split = 0;
      };

      # Overview Setting
      hotarea_size = 10;
      enable_hotarea = 0;
      overviewgappi = 5;
      overviewgappo = 30;
      overcircle_center_ratio = 0.5;

      # Misc
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus = {
        on_activate = 1;
        cross_monitor = 0;
        cross_tag = 0;
      };
      focusdir_only_zone_overlap = 1;
      idleinhibit_ignore_visible = 0;
      sloppyfocus = 1;
      warpcursor = 1;
      enable_floating_snap = 0;
      snap_distance = 30;
      cursor_size = 24;
      drag_tile = {
        to_tile = 1;
        small = 1;
      };
      cursor = {
        hide_timeout = 1000;
        hide_on_keypress = 1;
      };

      # Keyboard
      repeat_rate = 40;
      repeat_delay = 300;
      numlockon = 0;
      xkb_rules_layout = "us";

      # Trackpad
      # need relogin to make it apply
      trackpad = {
        natural_scrolling = 0;
        disable_while_typing = 1;
        left_handed = 0;
        middle_button_emulation = 0;
      };
      swipe_min_threshold = 1;

      # Mouse
      # need relogin to make it apply
      mouse = {
        natural_scrolling = 0;
      };

      # Appearance
      gappih = 5;
      gappiv = 5;
      gappoh = 5;
      gappov = 5;
      scratchpad = {
        width_ratio = 0.8;
        height_ratio = 0.9;
      };
      borderpx = 2;
      rootcolor = "0x201b14ff";
      bordercolor = "0x444444ff";
      dropcolor = "0x8FBA7C55";
      splitcolor = "0xEB441EFF";
      focuscolor = "0xc9b890ff";
      maximizescreencolor = "0x89aa61ff";
      urgentcolor = "0xad401fff";
      scratchpadcolor = "0x516c93ff";
      globalcolor = "0xb153a7ff";
      overlaycolor = "0x14a57cff";

      # layout support:
      # tile, scroller, grid, deck, monocle, center_tile, vertical_tile, vertical_scroller
      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      # Mouse Button Bindings
      # btn_left and btn_right can't bind none mod key
      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "NONE,btn_middle,togglemaximizescreen,0"
        "SUPER,btn_right,moveresize,curresize"
      ];

      # Axis Bindings
      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
      ];

      # Gesture Bindings
      gesturebind = [
        "none,left,3,focusdir,left"
        "none,right,3,focusdir,right"
        "none,up,3,focusdir,up"
        "none,down,3,focusdir,down"
        # "none,right,4,viewprev_have_client"
        # "none,left,4,viewnext_have_client"
        # "none,up,4,enteroverview"
        # "none,down,4,leaveoverview"
      ];

      # Layer rule
      layerrule = [
        "animation_type_open:zoom,layer_name:rofi"
        "animation_type_close:zoom,layer_name:rofi"
      ];

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none
      bind = [
        # reload config
        "SUPER,r,reload_config"

        # menu and terminal
        "SUPER,space,spawn,rofi -show drun"
        "SUPER,Return,spawn,kitty -1"

        "SUPER+SHIFT,Return,spawn,brave"

        # exit
        "SUPER,m,quit"
        "SUPER+SHIFT,q,killclient,"

        # switch window focus
        "SUPER,Tab,focusstack,next"
        "SUPER,h,focusdir,left"
        "SUPER,l,focusdir,right"
        "SUPER,k,focusdir,up"
        "SUPER,j,focusdir,down"

        # swap window
        "SUPER+SHIFT,k,exchange_client,up"
        "SUPER+SHIFT,j,exchange_client,down"
        "SUPER+SHIFT,h,exchange_client,left"
        "SUPER+SHIFT,l,exchange_client,right"

        # switch window status
        "SUPER,g,toggleglobal,"
        "ALT,Tab,togglejump,"
        "ALT,backslash,togglefloating,"
        "SUPER,a,togglemaximizescreen,"
        "SUPER,f,togglefullscreen,"
        "ALT+SHIFT,f,togglefakefullscreen,"
        "SUPER,i,minimized,"
        "SUPER,o,toggleoverlay,"
        "SUPER+SHIFT,I,restore_minimized"
        "ALT,z,toggle_scratchpad"

        # scroller layout
        "ALT,e,set_proportion,1.0"
        "ALT,x,switch_proportion_preset,"
        "alt+super+ctrl,Left,scroller_stack,left"
        "alt+super+ctrl,Right,scroller_stack,right"
        "alt+super+ctrl,Up,scroller_stack,up"
        "alt+super+ctrl,Down,scroller_stack,down"

        #dwindle layout(manual split mode)
        "alt+shift,Return,dwindle_toggle_split_direction"

        # switch layout
        "SUPER,n,switch_layout"

        # tag switch
        "SUPER,Left,viewtoleft,0"
        "CTRL,Left,viewtoleft_have_client,0"
        "SUPER,Right,viewtoright,0"
        "CTRL,Right,viewtoright_have_client,0"
        "CTRL+SUPER,Left,tagtoleft,0"
        "CTRL+SUPER,Right,tagtoright,0"

        "SUPER,1,view,1,0"
        "SUPER,2,view,2,0"
        "SUPER,3,view,3,0"
        "SUPER,4,view,4,0"
        "SUPER,5,view,5,0"
        "SUPER,6,view,6,0"
        "SUPER,7,view,7,0"
        "SUPER,8,view,8,0"
        "SUPER,9,view,9,0"

        # tag: move client to the tag and focus it
        # tagsilent: move client to the tag and not focus it
        # bind=Alt,1,tagsilent,1
        "SUPER+SHIFT,1,tag,1,0"
        "SUPER+SHIFT,2,tag,2,0"
        "SUPER+SHIFT,3,tag,3,0"
        "SUPER+SHIFT,4,tag,4,0"
        "SUPER+SHIFT,5,tag,5,0"
        "SUPER+SHIFT,6,tag,6,0"
        "SUPER+SHIFT,7,tag,7,0"
        "SUPER+SHIFT,8,tag,8,0"
        "SUPER+SHIFT,9,tag,9,0"

        # monitor switch
        "SUPER,Comma,focusmon,left"
        "SUPER,Period,focusmon,right"
        "SUPER+Shift,Comma,tagmon,left"
        "SUPER+Shift,Period,tagmon,right"

        # gaps
        "ALT+SHIFT,X,incgaps,1"
        "ALT+SHIFT,Z,incgaps,-1"
        "ALT+SHIFT,R,togglegaps"

        # movewin
        "CTRL+SHIFT,k,movewin,+0,-50"
        "CTRL+SHIFT,j,movewin,+0,+50"
        "CTRL+SHIFT,l,movewin,-50,+0"
        "CTRL+SHIFT,h,movewin,+50,+0"

        # resizewin
        "CTRL+ALT,k,resizewin,+0,-50"
        "CTRL+ALT,j,resizewin,+0,+50"
        "CTRL+ALT,h,resizewin,-50,+0"
        "CTRL+ALT,l,resizewin,+50,+0"
      ];

      # Keymodes (submaps) for modal keybindings
      keymode = {
        resize = {
          bind = [
            "NONE,Left,resizewin,-10,0"
            "NONE,Escape,setkeymode,default"
          ];
        };
      };
    };
  };
}
