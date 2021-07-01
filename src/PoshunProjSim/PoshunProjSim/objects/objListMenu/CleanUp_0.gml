/// @desc Clean up the datastructure
if ds_exists(ds_type_list, global.buttonList) {
	ds_list_destroy(global.buttonList);
}