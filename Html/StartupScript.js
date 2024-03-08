var Addin = document.getElementById('controlAddIn');

Addin.innerHTML=
`<div class="container">
    <div class="steps">
        <span class="test active">1</span>
        <span class="test">2</span>
        <span class="test">3</span>
        <span class="test">4</span>
        <span class="test">5</span> 
        <div class="progress-bar">
            <span class="indicator"></span>
        </div>
    </div>
    <div class="column" style="display: flex" ;flex-direction:column>
        <p style="margin-right:15%">Created</p>
        <p style="margin-right:11%">Process</p>
        <p style="margin-right:10%">Order Created</p>
        <p style="margin-right:14%">Released</p>
        <p >Posted</p>
    </div>
</div>`;

var progress = 1;

 Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('IAmReady',[]);