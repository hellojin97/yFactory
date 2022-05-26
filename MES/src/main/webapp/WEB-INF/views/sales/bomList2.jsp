<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>

		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h1>BOM 조회</h1>
		</div>



		<div id="tree" class="tui-tree-wrap"></div>


	<script type="text/javascript">
	
		var util = {
	            addEventListener: function(element, eventName, handler) {
	                if (element.addEventListener) {
	                    element.addEventListener(eventName, handler, false);
	                } else {
	                    element.attachEvent('on' + eventName, handler);
	                }
	            }
	        };

	        var data = [
	            {text: 'rootA', children: [
	                {text: 'sub-A1'},
	                {text: 'sub-A2'},
	                {text: 'sub-A3'},
	                {text: 'sub-A4'},
	                {text: 'sub-A5', state: 'closed', children: [
	                    {text:'sub-A5A', children:[
	                        {text:'sub-A5A1'}
	                    ]},
	                    {text:'sub_A5B'}
	                ]},
	                {text: 'sub-A6'},
	                {text: 'sub-A7'},
	                {text: 'sub-A8'},
	                {text: 'sub-A9', state: 'closed', children: [
	                    {text:'sub-A9A'},
	                    {text:'sub-A9B'}
	                ]},
	                {text: 'sub-A10'},
	                {text: 'sub-A11'},
	                {text: 'sub-A12'}
	            ]},
	            {text: 'rootB', state:'closed', children: [
	                {text:'sub-B1'},
	                {text:'sub-B2'},
	                {text:'sub-B3'}
	            ]}
	        ];

	        var tree = new tui.Tree('#tree', {
	            data: data,
	            nodeDefaultState: 'opened',
	            template: {
	                internalNode:
	                    '<div class="tui-tree-content-wrapper" style="padding-left: {{indent}}px">' +
	                        '<button type="button" class="tui-tree-toggle-btn tui-js-tree-toggle-btn">' +
	                            '<span class="tui-ico-tree"></span>' +
	                            '{{stateLabel}}' +
	                        '</button>' +
	                        '<span class="tui-tree-text tui-js-tree-text">' +
	                            '<label class="tui-checkbox">' +
	                        	   '<span class="tui-ico-check"><input type="checkbox" class="tui-tree-checkbox"></span>' +
	                        	'</label>' +
	                            '<span class="tui-tree-ico tui-ico-folder"></span>' +
	                            '{{text}}' +
	                        '</span>' +
	                    '</div>' +
	                    '<ul class="tui-tree-subtree tui-js-tree-subtree">{{children}}</ul>',
	                leafNode:
	                    '<div class="tui-tree-content-wrapper" style="padding-left: {{indent}}px">' +
	                        '<span class="tui-tree-text tui-js-tree-text">' +
	                            '<label class="tui-checkbox">' +
	                               '<span class="tui-ico-check"><input type="checkbox" class="tui-tree-checkbox"></span>' +
	                            '</label>' +
	                            '<span class="tui-tree-ico tui-ico-file"></span>' +
	                            '{{text}}' +
	                        '</span>' +
	                    '</div>'
	            }
	        }).enableFeature('Checkbox', {
	            checkboxClassName: 'tui-tree-checkbox',
	        });

	        var checkBtn = document.getElementById('checkBtn');
	        var uncheckBtn = document.getElementById('uncheckBtn');
	        var checkedValue = document.getElementById('checkedValue');
	        var rootNodeId = tree.getRootNodeId();
	        var firstChildId = tree.getChildIds(rootNodeId)[0];

	        tree.on('check', function(eventData) {
	            var nodeData = tree.getNodeData(eventData.nodeId);
	            checkedValue.value = 'checked : ' + nodeData.text;
	        });

	        tree.on('uncheck', function(eventData) {
	            var nodeData = tree.getNodeData(eventData.nodeId);
	            checkedValue.value = 'unchecked : ' + nodeData.text;
	        });

	        util.addEventListener(checkBtn, 'click', function() {
	            tree.check(firstChildId);
	        });

	        util.addEventListener(uncheckBtn, 'click', function() {
	            tree.uncheck(firstChildId);
	        });
		
  </script>

</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>