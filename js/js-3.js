// 課題 JS-3 の実装をここに記述してください。

var submit_button = document.getElementById("submit-button");
submit_button.addEventListener("click", function () {
	var log_input = document.getElementById("log-input");
	var log_str = log_input.value;

	var records = parseLTSVLog(log_str);
	var table_container = document.getElementById("table-container");

	createLogTable(table_container, records);
});

