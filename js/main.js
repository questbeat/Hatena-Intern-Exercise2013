// 課題 JS-1: 関数 `parseLTSVLog` を記述してください

function parseLTSVLog(logStr) {
	var records = [];
	var lines = logStr.split("\n").filter(function (e) { return (e != ""); });

	for (var i = 0; i < lines.length; i++) {
		var line = lines[i];
		var record = {};
		var pairs = line.split("\t");
		
		for (var j = 0; j < pairs.length; j++) {
			var pair = pairs[j];
			var matched = pair.match(/(.+?):(.+)/);
			var key = matched[1];
			var value = matched[2];

			if (key == "reqtime_microsec") {
				value = Number(value);
			}

			record[key] = value;
		}

		records.push(record);
	}

	return records;
}

// 課題 JS-2: 関数 `createLogTable` を記述してください

function createLogTable(root, records) {
	var table = document.createElement("table");
	
	// headの作成
	var th1 = document.createElement("th");
	th1.textContent = "path";

	var th2 = document.createElement("th");
	th2.textContent = "reqtime_microsec";

	var thr = document.createElement("tr");
	thr.appendChild(th1);
	thr.appendChild(th2);

	var thead = document.createElement("thead");
	thead.appendChild(thr);

	table.appendChild(thead);

	// bodyの作成
	var tbody = document.createElement("tbody");

	for (var i = 0; i < records.length; i++) {
		var record = records[i];

		var tr = document.createElement("tr");

		for (var key in record) {
			var td = document.createElement("td");
			td.textContent = record[key];

			tr.appendChild(td);
		}
		
		tbody.appendChild(tr);
	}

	table.appendChild(tbody);

	root.appendChild(table);
}
