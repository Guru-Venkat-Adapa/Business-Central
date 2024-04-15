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

    procedure WriteAPI(Url: Text[100]; Username: Text[100]; Password: Text[100])
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
                // Message('Request successful %1', Response)
                ReadFromResponse(Response)
            else
                Message('Request failed %1', Response);
        end;
    end;

    local procedure ReadFromResponse(Response: Text)
    var
        HttpClient: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        HttpHeaders: HttpHeaders;
        HttpContent: HttpContent;
        BodyText: Text;
        ResponseText: Text;
        JsonArray: JsonArray;
        JsonToken: JsonToken;
        jsonObject: jsonObject;
        FoundJsonToken: JsonToken;
        FoundJsonObject: JsonObject;
        FoundArray: text;
        Address: Text;
        Address2: Text;
        ArrayJSONManagement: Codeunit "JSON Management";
        JSONManagement: Codeunit "JSON Management";
        ObjectJSONManagement: Codeunit "JSON Management";
        APItable: Record "API NZ-AU";
        i: Integer;
        reciptno: Integer;
    begin
        Clear(HttpContent);
        Clear(HttpClient);
        Clear(HttpHeaders);
        Clear(HttpRequestMessage);
        Clear(HttpResponseMessage);
        if not JsonArray.ReadFrom(Response) then begin
            JsonToken.ReadFrom(Response);
            JsonObject := JsonToken.AsObject();
            JSONManagement.InitializeObject(Response);
            JSONManagement.GetArrayPropertyValueAsStringByName('data', FoundArray);
            if not (FoundArray = '[]') then begin

                JsonArray.ReadFrom(FoundArray);
                for i := 0 to JsonArray.Count - 1 do begin
                    JsonArray.Get(i, FoundJsonToken);
                    //   JsonArray.Get(0, FoundJsonToken);
                    FoundJsonObject := FoundJsonToken.AsObject();

                    // FoundJsonObject.Get('data', JsonToken);
                    // jsonObject := JsonToken.AsObject();
                    APItable.Reset();
                    APItable.Init();

                    if APItable.FindLast() then
                        APItable."No." := APItable."No." + 1
                    else
                        APItable."No." := 1;

                    FoundJsonObject.Get('receiptNumber', FoundJsonToken);
                    APItable."Receipt No." := FoundJsonToken.AsValue().AsInteger();
                    reciptno := APItable."Receipt No.";

                    FoundJsonObject.Get('principalAmount', FoundJsonToken);
                    jsonObject := FoundJsonToken.AsObject();
                    jsonObject.Get('currency', JsonToken);
                    APItable."Pirc Amt Currency" := JsonToken.AsValue().AsText();
                    Clear(JsonToken);
                    jsonObject.Get('amount', JsonToken);
                    APItable."Pric Amt Amount" := JsonToken.AsValue().AsDecimal();

                    FoundJsonObject.Get('status', FoundJsonToken);
                    APItable.Status := FoundJsonToken.AsValue().AsText();

                    // FoundJsonObject.Get('customerReferenceNumber', FoundJsonToken);
                    // APItable."Customer Ref No." := FoundJsonToken.AsValue().AsInteger();

                    //To check wheather the record is already present in table or not
                    APItable.SetFilter("Receipt No.", Format(reciptno));
                    if not APItable.FindSet() then begin
                        //end;

                        APItable.Insert(true);
                        APItable."No." += 1;
                    end;
                end;

            end;
        end;
    end;

    // procedure WriteAPI(Url: Text[100]; Username: Text[100]; Password: Text[100]; Table: Record "API NZ-AU")
    // var
    //     HttpClient: HttpClient;
    //     RequestMessage: HttpRequestMessage;
    //     ResponseMessage: HttpResponseMessage;
    //     RequestHeader: HttpHeaders;
    //     Base64Convert: Codeunit "Base64 Convert";
    //     Response: Text;

    //     JsonMag: Codeunit "JSON Management";
    //     ArrayJsonMag: Codeunit "JSON Management";
    //     Content: HttpContent;
    //     JsonObj: JsonObject;
    //     JsonToken: JsonToken;
    //     JsonTemp: Text;
    //     i: Integer;
    //     JsonTable: Record "API NZ-AU";
    // begin
    //     RequestMessage.SetRequestUri(Url);
    //     RequestMessage.Method('GET');

    //     RequestMessage.GetHeaders(RequestHeader);
    //     RequestHeader.Add('Authorization', 'Basic' + Base64Convert.ToBase64(Username + ':' + Password));

    //     if HttpClient.Send(RequestMessage, ResponseMessage) then begin
    //         ResponseMessage.Content.ReadAs(Response);

    //         if ResponseMessage.IsSuccessStatusCode then begin

    //             Content := ResponseMessage.Content;
    //             Content.ReadAs(Response);
    //             ArrayJsonMag.InitializeCollection(Response);
    //             for i := 0 to ArrayJsonMag.GetCollectionCount() - 1 do begin
    //                 ArrayJsonMag.GetObjectFromCollectionByIndex(JsonTemp, i);
    //                 JsonMag.InitializeObject(JsonTemp);
    //                 JsonObj.ReadFrom(JsonTemp);
    //                 JsonTable.Init();
    //                 JsonObj.Get('receiptNumber', JsonToken);
    //                 JsonTable."Receipt No." := JsonToken.AsValue().AsInteger();

    //                 if not Table.Get(JsonTable."Receipt No.") then begin
    //                     JsonTable.Insert();
    //                 end else
    //                     Message('Record %1 already exists', JsonTable."Receipt No.");
    //             end
    //         end;
    //     end
    //     else
    //         Message('Request failed %1', Response);
    // end;

    Procedure GetSingleAPI(Url: Text[100]; Username: Text[100]; Password: Text[100]; Table: Record "API NZ-AU")
    var
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        RequestMessage: HttpRequestMessage;
        RequestHeader: HttpHeaders;
        Content: HttpContent;
        Output: Text;
        JObject: JsonObject;
        JToken: JsonToken;
        Response: Text;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        RequestMessage.SetRequestUri(Url);
        RequestMessage.Method('GET');

        RequestMessage.GetHeaders(RequestHeader);
        RequestHeader.Add('Authorization', 'Basic' + Base64Convert.ToBase64(Username + ':' + Password));

        if HttpClient.Send(RequestMessage, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(Response);

            if ResponseMessage.IsSuccessStatusCode then begin
                // Message('Request successful %1', Response)
                Content := ResponseMessage.Content;
                Content.ReadAs(Response);
                JObject.ReadFrom(Response);

                JObject.Get('status', JToken);
                Table.Status := JToken.AsValue().AsText();
                JObject.Get('responseCode', JToken);
                Table."Response Code" := JToken.AsValue().AsText();
                JObject.Get('transactionType', JToken);
                Table."Transaction Type" := JToken.AsValue().AsText();
                JObject.Get('transactionTime', JToken);
                Table."Transaction Time" := JToken.AsValue().AsDateTime();
                Table.Insert(true);
            end
            else
                Message('found errors %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase);
        end
        else
            Message('Request failed %1', Response);
    end;
}