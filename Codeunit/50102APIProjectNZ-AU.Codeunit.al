codeunit 50102 "API PRoject NZ_AU"
{
    procedure GetAPI(Url: Text[100]; Username: Text[100]; Password: Text[100])
    var
        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        RequestHeader: HttpHeaders;
        Base64Convert: Codeunit "Base64 Convert";
        Response: Text;
    begin
        RequestMessage.SetRequestUri(Url);
        RequestMessage.Method('GET');

        RequestMessage.GetHeaders(RequestHeader);
        RequestHeader.Add('Authorization', 'Basic' + Base64Convert.ToBase64(Username + ':' + Password));

        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);

            if ResponseMessage.IsSuccessStatusCode then
                Message('Request successful %1', Response)
            else
                Message('Request failed %1', Response);
        end;
    end;
}