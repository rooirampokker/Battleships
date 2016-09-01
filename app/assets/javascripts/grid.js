$(function ()  {
	generateTable('#enemyTable');
	generateTable('#playerTable');
});
	function generateTable(tableID) {
		var table = $("<div>").addClass('gridContainer table');
		for (y=0; y<10; y++) {


			var row = $("<div>").addClass('row');
			for (x=0; x<10; x++) {
				var col = $("<div>").addClass('col').text(y+","+x).attr('id', x+"-"+y);
				row.append(col);	
			}
			table.append(row);





		}
		$(tableID).html(table);	
	}