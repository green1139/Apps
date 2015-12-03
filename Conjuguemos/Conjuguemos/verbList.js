pages=new Array('EMPTY',

'1STCONJ',

'2NDCONJ',

'3RDCONJ',

'3RD-IO-CONJ',

'4THCONJ',

'ALL');



function send(target) {

	var end=document.form.verbs.selectedIndex;

	var language="latin";

	var vt=pages[end];

	var id=target+"-"+vt;

	

	

	var url="https://conjuguemos.com/activity.php?type=verbs&source=public&language=latin&id="+id;

	if (end==0) {

		alert ('Please select the type of verbs you want to practice before you click an exercise.');

		return

	}

	

	else {

		

		location.href=url

		return

	}

}



function listOfVerbs(l,i) {

	if (language=="latin") {

		var v=document.form.verb_type.value;

		if (v==0){

			alert("Please select the type of verbs you want.");

			return

		}

		i=i+"-"+v;

	}



	var verbs="verbs.php?language="+l+"&id="+i;

	window.open(verbs,"verbs","width=250,height=450,scrollbars=yes");

}



function latinVerb(n) {



	document.form.verb_type.value=n	



}



