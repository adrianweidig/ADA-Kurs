pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__g002binding.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__g002binding.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__os_lib_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__exceptions_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__tags_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__streams_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "gnat_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "interfaces__c__strings_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__finalization_root_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__finalization_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__storage_pools_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__finalization_masters_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__storage_pools__subpools_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__pool_global_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "glib_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "gtkada__types_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "gdk__frame_timings_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "glib__glist_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "gdk__visual_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "glib__gslist_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "gtkada__c_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "glib__object_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "glib__type_conversion_hooks_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "glib__types_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "glib__values_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "gtkada__bindings_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "cairo_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "cairo__region_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "gdk__rectangle_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "glib__generic_properties_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "gdk__color_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "gdk__rgba_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "gdk__event_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "glib__key_file_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "glib__properties_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "glib__string_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "glib__variant_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "glib__g_icon_E");
   E327 : Short_Integer; pragma Import (Ada, E327, "gtk__actionable_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "gtk__builder_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "gtk__buildable_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "gtk__cell_area_context_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "gtk__css_section_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "gtk__enums_E");
   E315 : Short_Integer; pragma Import (Ada, E315, "gtk__orientable_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "gtk__paper_size_E");
   E299 : Short_Integer; pragma Import (Ada, E299, "gtk__page_setup_E");
   E311 : Short_Integer; pragma Import (Ada, E311, "gtk__print_settings_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "gtk__target_entry_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "gtk__target_list_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "pango__enums_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "pango__attributes_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "pango__font_metrics_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "pango__language_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "pango__font_E");
   E319 : Short_Integer; pragma Import (Ada, E319, "gtk__text_attributes_E");
   E321 : Short_Integer; pragma Import (Ada, E321, "gtk__text_tag_E");
   E237 : Short_Integer; pragma Import (Ada, E237, "pango__font_face_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "pango__font_family_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "pango__fontset_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "pango__matrix_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "pango__context_E");
   E307 : Short_Integer; pragma Import (Ada, E307, "pango__font_map_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "pango__tabs_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "pango__layout_E");
   E305 : Short_Integer; pragma Import (Ada, E305, "gtk__print_context_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "gdk__display_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "gdk__frame_clock_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "gdk__pixbuf_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "gdk__screen_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "gdk__device_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "gdk__drag_contexts_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "gdk__window_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "gtk__accel_group_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "gtk__adjustment_E");
   E265 : Short_Integer; pragma Import (Ada, E265, "gtk__cell_editable_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "gtk__editable_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "gtk__entry_buffer_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "gtk__icon_source_E");
   E309 : Short_Integer; pragma Import (Ada, E309, "gtk__print_operation_preview_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "gtk__selection_data_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "gtk__style_E");
   E317 : Short_Integer; pragma Import (Ada, E317, "gtk__text_iter_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "gtk__tree_model_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "gtk__widget_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "gtk__cell_renderer_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "gtk__cell_layout_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "gtk__cell_area_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "gtk__container_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "gtk__bin_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "gtk__box_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "gtk__entry_completion_E");
   E293 : Short_Integer; pragma Import (Ada, E293, "gtk__misc_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "gtk__notebook_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "gtk__status_bar_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "gtk__style_provider_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "gtk__settings_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "gtk__style_context_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "gtk__icon_set_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "gtk__image_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "gtk__gentry_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "gtk__window_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "gtk__dialog_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "gtk__print_operation_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "gtk__arguments_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "glib__menu_model_E");
   E325 : Short_Integer; pragma Import (Ada, E325, "gtk__action_E");
   E329 : Short_Integer; pragma Import (Ada, E329, "gtk__activatable_E");
   E323 : Short_Integer; pragma Import (Ada, E323, "gtk__button_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "gtk__grid_E");
   E343 : Short_Integer; pragma Import (Ada, E343, "gtk__main_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "gtk__menu_item_E");
   E341 : Short_Integer; pragma Import (Ada, E341, "gtk__menu_shell_E");
   E335 : Short_Integer; pragma Import (Ada, E335, "gtk__menu_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "gtk__label_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E333 := E333 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "gtk__label__finalize_spec");
      begin
         F1;
      end;
      E335 := E335 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gtk__menu__finalize_spec");
      begin
         F2;
      end;
      E341 := E341 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gtk__menu_shell__finalize_spec");
      begin
         F3;
      end;
      E339 := E339 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gtk__menu_item__finalize_spec");
      begin
         F4;
      end;
      E331 := E331 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gtk__grid__finalize_spec");
      begin
         F5;
      end;
      E323 := E323 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gtk__button__finalize_spec");
      begin
         F6;
      end;
      E325 := E325 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gtk__action__finalize_spec");
      begin
         F7;
      end;
      E337 := E337 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "glib__menu_model__finalize_spec");
      begin
         F8;
      end;
      E249 := E249 - 1;
      E200 := E200 - 1;
      E281 := E281 - 1;
      E289 := E289 - 1;
      E218 := E218 - 1;
      E313 := E313 - 1;
      E297 := E297 - 1;
      E295 := E295 - 1;
      E255 := E255 - 1;
      E271 := E271 - 1;
      E269 := E269 - 1;
      E186 := E186 - 1;
      E180 := E180 - 1;
      E279 := E279 - 1;
      E273 := E273 - 1;
      E263 := E263 - 1;
      E214 := E214 - 1;
      E208 := E208 - 1;
      E192 := E192 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gtk__print_operation__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gtk__dialog__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gtk__window__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gtk__gentry__finalize_spec");
      begin
         F12;
      end;
      E283 := E283 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gtk__image__finalize_spec");
      begin
         F13;
      end;
      E285 := E285 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gtk__icon_set__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gtk__style_context__finalize_spec");
      begin
         F15;
      end;
      E188 := E188 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gtk__settings__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gtk__status_bar__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gtk__notebook__finalize_spec");
      begin
         F18;
      end;
      E293 := E293 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gtk__misc__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gtk__entry_completion__finalize_spec");
      begin
         F20;
      end;
      E170 := E170 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gtk__box__finalize_spec");
      begin
         F21;
      end;
      E253 := E253 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gtk__bin__finalize_spec");
      begin
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gtk__container__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gtk__cell_area__finalize_spec");
      begin
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gtk__cell_renderer__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gtk__widget__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gtk__tree_model__finalize_spec");
      begin
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gtk__style__finalize_spec");
      begin
         F28;
      end;
      E216 := E216 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gtk__selection_data__finalize_spec");
      begin
         F29;
      end;
      E287 := E287 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gtk__icon_source__finalize_spec");
      begin
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "gtk__entry_buffer__finalize_spec");
      begin
         F31;
      end;
      declare
         procedure F32;
         pragma Import (Ada, F32, "gtk__adjustment__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "gtk__accel_group__finalize_spec");
      begin
         F33;
      end;
      E206 := E206 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "gdk__drag_contexts__finalize_spec");
      begin
         F34;
      end;
      E204 := E204 - 1;
      declare
         procedure F35;
         pragma Import (Ada, F35, "gdk__device__finalize_spec");
      begin
         F35;
      end;
      E190 := E190 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "gdk__screen__finalize_spec");
      begin
         F36;
      end;
      E212 := E212 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "gdk__pixbuf__finalize_spec");
      begin
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "gdk__frame_clock__finalize_spec");
      begin
         F38;
      end;
      declare
         procedure F39;
         pragma Import (Ada, F39, "gdk__display__finalize_spec");
      begin
         F39;
      end;
      E305 := E305 - 1;
      declare
         procedure F40;
         pragma Import (Ada, F40, "gtk__print_context__finalize_spec");
      begin
         F40;
      end;
      E243 := E243 - 1;
      declare
         procedure F41;
         pragma Import (Ada, F41, "pango__layout__finalize_spec");
      begin
         F41;
      end;
      E247 := E247 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "pango__tabs__finalize_spec");
      begin
         F42;
      end;
      E307 := E307 - 1;
      declare
         procedure F43;
         pragma Import (Ada, F43, "pango__font_map__finalize_spec");
      begin
         F43;
      end;
      E225 := E225 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "pango__context__finalize_spec");
      begin
         F44;
      end;
      E239 := E239 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "pango__fontset__finalize_spec");
      begin
         F45;
      end;
      E235 := E235 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "pango__font_family__finalize_spec");
      begin
         F46;
      end;
      E237 := E237 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "pango__font_face__finalize_spec");
      begin
         F47;
      end;
      E321 := E321 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "gtk__text_tag__finalize_spec");
      begin
         F48;
      end;
      E229 := E229 - 1;
      declare
         procedure F49;
         pragma Import (Ada, F49, "pango__font__finalize_spec");
      begin
         F49;
      end;
      E233 := E233 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "pango__language__finalize_spec");
      begin
         F50;
      end;
      E231 := E231 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "pango__font_metrics__finalize_spec");
      begin
         F51;
      end;
      E245 := E245 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "pango__attributes__finalize_spec");
      begin
         F52;
      end;
      E220 := E220 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "gtk__target_list__finalize_spec");
      begin
         F53;
      end;
      E311 := E311 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "gtk__print_settings__finalize_spec");
      begin
         F54;
      end;
      E299 := E299 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "gtk__page_setup__finalize_spec");
      begin
         F55;
      end;
      E303 := E303 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "gtk__paper_size__finalize_spec");
      begin
         F56;
      end;
      E291 := E291 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "gtk__css_section__finalize_spec");
      begin
         F57;
      end;
      E275 := E275 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "gtk__cell_area_context__finalize_spec");
      begin
         F58;
      end;
      E176 := E176 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "gtk__builder__finalize_spec");
      begin
         F59;
      end;
      E259 := E259 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "glib__variant__finalize_spec");
      begin
         F60;
      end;
      E142 := E142 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "glib__object__finalize_spec");
      begin
         F61;
      end;
      E210 := E210 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "gdk__frame_timings__finalize_spec");
      begin
         F62;
      end;
      E104 := E104 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "glib__finalize_spec");
      begin
         F63;
      end;
      E122 := E122 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "system__pool_global__finalize_spec");
      begin
         F64;
      end;
      E126 := E126 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "system__storage_pools__subpools__finalize_spec");
      begin
         F65;
      end;
      E113 := E113 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "system__finalization_masters__finalize_spec");
      begin
         F66;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      Interfaces.C'Elab_Spec;
      E078 := E078 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Object_Reader'Elab_Spec;
      E080 := E080 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      System.Os_Lib'Elab_Body;
      E072 := E072 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      E008 := E008 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E005 := E005 + 1;
      Ada.Streams'Elab_Spec;
      E111 := E111 + 1;
      Gnat'Elab_Spec;
      E147 := E147 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E109 := E109 + 1;
      System.Finalization_Root'Elab_Spec;
      E118 := E118 + 1;
      Ada.Finalization'Elab_Spec;
      E116 := E116 + 1;
      System.Storage_Pools'Elab_Spec;
      E120 := E120 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E113 := E113 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E126 := E126 + 1;
      System.Pool_Global'Elab_Spec;
      E122 := E122 + 1;
      Glib'Elab_Spec;
      Gtkada.Types'Elab_Spec;
      E107 := E107 + 1;
      E104 := E104 + 1;
      Gdk.Frame_Timings'Elab_Spec;
      Gdk.Frame_Timings'Elab_Body;
      E210 := E210 + 1;
      E158 := E158 + 1;
      Gdk.Visual'Elab_Body;
      E194 := E194 + 1;
      E160 := E160 + 1;
      E152 := E152 + 1;
      Glib.Object'Elab_Spec;
      E144 := E144 + 1;
      Glib.Values'Elab_Body;
      E156 := E156 + 1;
      E146 := E146 + 1;
      Glib.Object'Elab_Body;
      E142 := E142 + 1;
      E154 := E154 + 1;
      E162 := E162 + 1;
      E164 := E164 + 1;
      E166 := E166 + 1;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E140 := E140 + 1;
      Gdk.Color'Elab_Spec;
      E202 := E202 + 1;
      E184 := E184 + 1;
      E138 := E138 + 1;
      E301 := E301 + 1;
      E172 := E172 + 1;
      E261 := E261 + 1;
      Glib.Variant'Elab_Spec;
      Glib.Variant'Elab_Body;
      E259 := E259 + 1;
      E257 := E257 + 1;
      Gtk.Actionable'Elab_Spec;
      E327 := E327 + 1;
      Gtk.Builder'Elab_Spec;
      Gtk.Builder'Elab_Body;
      E176 := E176 + 1;
      E174 := E174 + 1;
      Gtk.Cell_Area_Context'Elab_Spec;
      Gtk.Cell_Area_Context'Elab_Body;
      E275 := E275 + 1;
      Gtk.Css_Section'Elab_Spec;
      Gtk.Css_Section'Elab_Body;
      E291 := E291 + 1;
      E196 := E196 + 1;
      Gtk.Orientable'Elab_Spec;
      E315 := E315 + 1;
      Gtk.Paper_Size'Elab_Spec;
      Gtk.Paper_Size'Elab_Body;
      E303 := E303 + 1;
      Gtk.Page_Setup'Elab_Spec;
      Gtk.Page_Setup'Elab_Body;
      E299 := E299 + 1;
      Gtk.Print_Settings'Elab_Spec;
      Gtk.Print_Settings'Elab_Body;
      E311 := E311 + 1;
      E222 := E222 + 1;
      Gtk.Target_List'Elab_Spec;
      Gtk.Target_List'Elab_Body;
      E220 := E220 + 1;
      E227 := E227 + 1;
      Pango.Attributes'Elab_Spec;
      Pango.Attributes'Elab_Body;
      E245 := E245 + 1;
      Pango.Font_Metrics'Elab_Spec;
      Pango.Font_Metrics'Elab_Body;
      E231 := E231 + 1;
      Pango.Language'Elab_Spec;
      Pango.Language'Elab_Body;
      E233 := E233 + 1;
      Pango.Font'Elab_Spec;
      Pango.Font'Elab_Body;
      E229 := E229 + 1;
      E319 := E319 + 1;
      Gtk.Text_Tag'Elab_Spec;
      Gtk.Text_Tag'Elab_Body;
      E321 := E321 + 1;
      Pango.Font_Face'Elab_Spec;
      Pango.Font_Face'Elab_Body;
      E237 := E237 + 1;
      Pango.Font_Family'Elab_Spec;
      Pango.Font_Family'Elab_Body;
      E235 := E235 + 1;
      Pango.Fontset'Elab_Spec;
      Pango.Fontset'Elab_Body;
      E239 := E239 + 1;
      E241 := E241 + 1;
      Pango.Context'Elab_Spec;
      Pango.Context'Elab_Body;
      E225 := E225 + 1;
      Pango.Font_Map'Elab_Spec;
      Pango.Font_Map'Elab_Body;
      E307 := E307 + 1;
      Pango.Tabs'Elab_Spec;
      Pango.Tabs'Elab_Body;
      E247 := E247 + 1;
      Pango.Layout'Elab_Spec;
      Pango.Layout'Elab_Body;
      E243 := E243 + 1;
      Gtk.Print_Context'Elab_Spec;
      Gtk.Print_Context'Elab_Body;
      E305 := E305 + 1;
      Gdk.Display'Elab_Spec;
      Gdk.Frame_Clock'Elab_Spec;
      Gdk.Pixbuf'Elab_Spec;
      E212 := E212 + 1;
      Gdk.Screen'Elab_Spec;
      Gdk.Screen'Elab_Body;
      E190 := E190 + 1;
      Gdk.Device'Elab_Spec;
      Gdk.Device'Elab_Body;
      E204 := E204 + 1;
      Gdk.Drag_Contexts'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Body;
      E206 := E206 + 1;
      Gdk.Window'Elab_Spec;
      E251 := E251 + 1;
      Gtk.Accel_Group'Elab_Spec;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Cell_Editable'Elab_Spec;
      Gtk.Entry_Buffer'Elab_Spec;
      Gtk.Icon_Source'Elab_Spec;
      Gtk.Icon_Source'Elab_Body;
      E287 := E287 + 1;
      Gtk.Selection_Data'Elab_Spec;
      Gtk.Selection_Data'Elab_Body;
      E216 := E216 + 1;
      Gtk.Style'Elab_Spec;
      E317 := E317 + 1;
      Gtk.Tree_Model'Elab_Spec;
      Gtk.Widget'Elab_Spec;
      Gtk.Cell_Renderer'Elab_Spec;
      E277 := E277 + 1;
      Gtk.Cell_Area'Elab_Spec;
      Gtk.Container'Elab_Spec;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E253 := E253 + 1;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E170 := E170 + 1;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E293 := E293 + 1;
      Gtk.Notebook'Elab_Spec;
      Gtk.Status_Bar'Elab_Spec;
      E198 := E198 + 1;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E188 := E188 + 1;
      Gtk.Style_Context'Elab_Spec;
      Gtk.Icon_Set'Elab_Spec;
      Gtk.Icon_Set'Elab_Body;
      E285 := E285 + 1;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E283 := E283 + 1;
      Gtk.Gentry'Elab_Spec;
      Gtk.Window'Elab_Spec;
      Gtk.Dialog'Elab_Spec;
      Gtk.Print_Operation'Elab_Spec;
      E182 := E182 + 1;
      Gdk.Display'Elab_Body;
      E192 := E192 + 1;
      Gdk.Frame_Clock'Elab_Body;
      E208 := E208 + 1;
      Gtk.Accel_Group'Elab_Body;
      E214 := E214 + 1;
      Gtk.Adjustment'Elab_Body;
      E263 := E263 + 1;
      Gtk.Cell_Area'Elab_Body;
      E273 := E273 + 1;
      E265 := E265 + 1;
      Gtk.Cell_Renderer'Elab_Body;
      E279 := E279 + 1;
      Gtk.Container'Elab_Body;
      E180 := E180 + 1;
      Gtk.Dialog'Elab_Body;
      E186 := E186 + 1;
      E267 := E267 + 1;
      Gtk.Entry_Buffer'Elab_Body;
      E269 := E269 + 1;
      Gtk.Entry_Completion'Elab_Body;
      E271 := E271 + 1;
      Gtk.Gentry'Elab_Body;
      E255 := E255 + 1;
      Gtk.Notebook'Elab_Body;
      E295 := E295 + 1;
      Gtk.Print_Operation'Elab_Body;
      E297 := E297 + 1;
      E309 := E309 + 1;
      Gtk.Status_Bar'Elab_Body;
      E313 := E313 + 1;
      Gtk.Style'Elab_Body;
      E218 := E218 + 1;
      Gtk.Style_Context'Elab_Body;
      E289 := E289 + 1;
      Gtk.Tree_Model'Elab_Body;
      E281 := E281 + 1;
      Gtk.Widget'Elab_Body;
      E200 := E200 + 1;
      Gtk.Window'Elab_Body;
      E249 := E249 + 1;
      Glib.Menu_Model'Elab_Spec;
      Glib.Menu_Model'Elab_Body;
      E337 := E337 + 1;
      Gtk.Action'Elab_Spec;
      Gtk.Action'Elab_Body;
      E325 := E325 + 1;
      Gtk.Activatable'Elab_Spec;
      E329 := E329 + 1;
      Gtk.Button'Elab_Spec;
      Gtk.Button'Elab_Body;
      E323 := E323 + 1;
      Gtk.Grid'Elab_Spec;
      Gtk.Grid'Elab_Body;
      E331 := E331 + 1;
      E343 := E343 + 1;
      Gtk.Menu_Item'Elab_Spec;
      Gtk.Menu_Item'Elab_Body;
      E339 := E339 + 1;
      Gtk.Menu_Shell'Elab_Spec;
      Gtk.Menu_Shell'Elab_Body;
      E341 := E341 + 1;
      Gtk.Menu'Elab_Spec;
      Gtk.Menu'Elab_Body;
      E335 := E335 + 1;
      Gtk.Label'Elab_Spec;
      Gtk.Label'Elab_Body;
      E333 := E333 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_g002binding");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   D:\Entwicklung\repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\obj\g002binding.o
   --   -LD:\Entwicklung\repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\obj\
   --   -LD:\Entwicklung\repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\obj\
   --   -LD:\Entwicklung\GNAT\lib\gtkada\gtkada.static\gtkada\
   --   -LD:/entwicklung/gnat/2020/lib/gcc/x86_64-pc-mingw32/9.3.1/adalib/
   --   -static
   --   -shared-libgcc
   --   -shared-libgcc
   --   -shared-libgcc
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
