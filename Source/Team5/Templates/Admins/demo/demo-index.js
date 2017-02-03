jQuery(document).ready(function() {

    //------------------------------
    // Powerify Panels
    //------------------------------

    $('#panel-advancedoptions').panels({
        localStorage: false, 
        sortable: true,
        toggleColors: true
    });


    //------------------------------
    // Date Range Picker
    //------------------------------

    $('#daterangepicker2').daterangepicker({
    ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
        'Last 7 Days': [moment().subtract('days', 6), moment()],
        'Last 30 Days': [moment().subtract('days', 29), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
    },
    opens: 'right',
    startDate: moment().subtract('days', 29),
    endDate: moment()
    },
    function(start, end) {
        $('#daterangepicker2 span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    });

    //------------------------------
    // Switch
    //------------------------------

    Switchery(document.querySelector('.js-switch-success'), {color: getBrandColor('success')});

// live dynamic

    var dxta = [],
        totalPoints = 300;
    var updateInterval = 1000;

    function getRandomData() {

        if (dxta.length > 0)
            dxta = dxta.slice(1);

        // Do a random walk

        while (dxta.length < totalPoints) {

            var prev = dxta.length > 0 ? dxta[dxta.length - 1] : 50,
                y = prev + Math.random() * 10 - 5;

            if (y < 0) {
                y = 0;
            } else if (y > 100) {
                y = 100;
            }

            dxta.push(y);
        }

        // Zip the generated y values with the x values

        var res = [];
        for (var i = 0; i < dxta.length; ++i) {
            res.push([i, dxta[i]])
        }

        return res;
    }

    function update() {

        if ($('#live-dynamic-switch:checked').length>0) {

            plot.setData([getRandomData()]);

            // Since the axes don't change, we don't need to call plot.setupGrid()

            plot.draw();
        }
        setTimeout(update, updateInterval);
    }

    update();


    $("#sortable-tasks, #completed-tasks").sortable({
      connectWith: ".connectedSortable",
      receive: function (event, ui) {
        $(ui.item[0]).find('.iCheck-helper')[0].dropped = true;
        $(ui.item[0]).find('.iCheck-helper').click()
      }
    }).disableSelection();

    $('#sortable-tasks .iCheck-helper, #completed-tasks .iCheck-helper').on('click', function () {
        if ($(this)[0].dropped == true) { $(this)[0].dropped = false; return; }
        if ($(this).closest('#sortable-tasks').length)
            $(this).closest('li').appendTo('#completed-tasks');
        else
            $(this).closest('li').appendTo('#sortable-tasks');
    });

});





//Info Tiles: Sparkline Variant
$("#tileorders").sparkline([112,182,130,191,75,214,159,138,156,120], {
    type: 'bar',
    barColor: 'rgba(255, 255, 255, 0.3)',
    barSpacing: 1,
    height: '13',
    barWidth: 3
});

$("#tilemembers").sparkline([41,38,73,49,51,20,55,13,35,23], {
    type: 'bar',
    barColor: 'rgba(255, 255, 255, 0.3)',
    barSpacing: 1,
    height: '13',
    barWidth: 3
});

$("#tiletickets").sparkline([50,100,78], { 
    type: 'pie',
    sliceColors: ['rgba(255, 255, 255, 0.75)','rgba(255, 255, 255, 0.5)','rgba(255, 255, 255, 0.25)'],
    height: '13',
    width: '13'
});

$("#tilerevenues").sparkline([11270,17257,15014,13107,15538,13439,17915,23874,16677,12003], {
    type: 'line',
    lineColor: 'rgba(255, 255, 255, 0.3)',
    lineWidth: '1.5',
    fillColor: 'transparent',
    height: '13',
    minSpotColor: false,
    maxSpotColor: false,
    spotColor: false,
    spotRadius: '0',
    highlightSpotColor: '#fff',
    highlightLineColor: '#fff',
    width: '40'
});

$("#tileprofits").sparkline([412,382,130,191,215,204,559,738,456,239], {
    type: 'line',
    lineColor: 'rgba(255, 255, 255, 0.3)',
    lineWidth: '1.5',
    fillColor: 'transparent',
    height: '13',
    minSpotColor: false,
    maxSpotColor: false,
    spotColor: false,
    spotRadius: '0',
    highlightSpotColor: '#fff',
    highlightLineColor: '#fff',
    width: '48'
});
