.class public Lcom/android/internal/telephony/SamsungBCMRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SamsungBCMRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 41
    const/4 v0, 0x6

    iput v0, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mQANElements:I

    .line 42
    return-void
.end method


# virtual methods
.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 3
    .parameter "address"
    .parameter "clirMode"
    .parameter "uusInfo"
    .parameter "result"

    .prologue
    const/4 v2, 0x0

    .line 46
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 48
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 52
    if-nez p3, :cond_0

    .line 53
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SamsungBCMRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    .line 63
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungBCMRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 64
    return-void

    .line 55
    :cond_0
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 56
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 57
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 58
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 9
    .parameter "p"

    .prologue
    const/4 v5, 0x0

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 71
    .local v3, serial:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 75
    .local v0, error:I
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/SamsungBCMRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 77
    .local v2, rr:Lcom/android/internal/telephony/RILRequest;
    if-nez v2, :cond_1

    .line 78
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected solicited response! sn: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v5

    .line 263
    .end local v2           #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_0
    :goto_0
    return-object v2

    .line 83
    .restart local v2       #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_1
    const/4 v1, 0x0

    .line 85
    .local v1, ret:Ljava/lang/Object;
    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v6

    if-lez v6, :cond_3

    .line 87
    :cond_2
    :try_start_0
    iget v6, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v6, :pswitch_data_0

    .line 211
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unrecognized solicited response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :catch_0
    move-exception v4

    .line 216
    .local v4, tr:Ljava/lang/Throwable;
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " exception, possible invalid RIL response"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v4}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 220
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_0

    .line 221
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v5, v4}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 222
    iget-object v5, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 93
    .end local v4           #tr:Ljava/lang/Throwable;
    :pswitch_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 232
    .end local v1           #ret:Ljava/lang/Object;
    :cond_3
    :goto_1
    iget v6, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v6, :sswitch_data_0

    .line 250
    :cond_4
    :goto_2
    if-eqz v0, :cond_6

    .line 251
    invoke-virtual {v2, v0, v1}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    goto :goto_0

    .line 94
    .restart local v1       #ret:Ljava/lang/Object;
    :pswitch_1
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 95
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 96
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 97
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 98
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 99
    :pswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 100
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 101
    :pswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 102
    :pswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 103
    :pswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 104
    :pswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 105
    :pswitch_c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 107
    :pswitch_d
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 108
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_5

    .line 109
    const-string v6, "testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    .line 110
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v6}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 113
    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    .line 114
    goto :goto_1

    .line 116
    :pswitch_e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 117
    :pswitch_f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 118
    :pswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 119
    :pswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 120
    :pswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 121
    :pswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 122
    :pswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 123
    :pswitch_15
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 124
    :pswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 125
    :pswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 126
    :pswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 127
    :pswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 128
    :pswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 129
    :pswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 130
    :pswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 131
    :pswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 132
    :pswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 133
    :pswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 134
    :pswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseCallForward(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 135
    :pswitch_21
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 136
    :pswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 137
    :pswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 138
    :pswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 139
    :pswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 140
    :pswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 141
    :pswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 142
    :pswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 143
    :pswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 144
    :pswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 145
    :pswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 146
    :pswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 147
    :pswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 148
    :pswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 149
    :pswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 150
    :pswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 151
    :pswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 152
    :pswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 153
    :pswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 154
    :pswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 155
    :pswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 156
    :pswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 157
    :pswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 158
    :pswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 159
    :pswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 160
    :pswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 161
    :pswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 162
    :pswitch_3c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 163
    :pswitch_3d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 164
    :pswitch_3e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 165
    :pswitch_3f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 166
    :pswitch_40
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 167
    :pswitch_41
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 168
    :pswitch_42
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 169
    :pswitch_43
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 170
    :pswitch_44
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 171
    :pswitch_45
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 172
    :pswitch_46
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 173
    :pswitch_47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 174
    :pswitch_48
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 175
    :pswitch_49
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseGetPreferredNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 176
    :pswitch_4a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseCellList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 177
    :pswitch_4b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 178
    :pswitch_4c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 179
    :pswitch_4d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 180
    :pswitch_4e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 181
    :pswitch_4f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 182
    :pswitch_50
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 183
    :pswitch_51
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 184
    :pswitch_52
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 185
    :pswitch_53
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 186
    :pswitch_54
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 187
    :pswitch_55
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 188
    :pswitch_56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 189
    :pswitch_57
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseGmsBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 190
    :pswitch_58
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 191
    :pswitch_59
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 192
    :pswitch_5a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseCdmaBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 193
    :pswitch_5b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 194
    :pswitch_5c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 195
    :pswitch_5d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 196
    :pswitch_5e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 197
    :pswitch_5f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 198
    :pswitch_60
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 199
    :pswitch_61
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 200
    :pswitch_62
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 201
    :pswitch_63
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 202
    :pswitch_64
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 203
    :pswitch_65
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 204
    :pswitch_66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 205
    :pswitch_67
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 206
    :pswitch_68
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 207
    :pswitch_69
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 208
    :pswitch_6a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 209
    :pswitch_6b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungBCMRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    goto/16 :goto_1

    .line 240
    .end local v1           #ret:Ljava/lang/Object;
    :sswitch_0
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_4

    .line 242
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ON enter sim puk fakeSimStatusChanged: reg count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    .line 245
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v6}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_2

    .line 255
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v7}, Lcom/android/internal/telephony/SamsungBCMRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {p0, v7, v1}, Lcom/android/internal/telephony/SamsungBCMRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    .line 258
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_0

    .line 259
    iget-object v6, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v1, v5}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 260
    iget-object v5, v2, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_4a
        :pswitch_4b
        :pswitch_4c
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_5d
        :pswitch_55
        :pswitch_56
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5a
        :pswitch_5b
        :pswitch_5c
        :pswitch_5e
        :pswitch_5f
        :pswitch_60
        :pswitch_61
        :pswitch_64
        :pswitch_62
        :pswitch_63
        :pswitch_65
        :pswitch_66
        :pswitch_67
        :pswitch_68
        :pswitch_69
        :pswitch_6a
        :pswitch_6b
    .end packed-switch

    .line 232
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0x5 -> :sswitch_0
        0x6 -> :sswitch_0
        0x7 -> :sswitch_0
        0x2b -> :sswitch_0
    .end sparse-switch
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 14
    .parameter "p"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 274
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 275
    .local v3, num:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 277
    .local v4, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_6

    .line 278
    new-instance v0, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v0}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 280
    .local v0, dc:Lcom/android/internal/telephony/DriverCall;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-static {v8}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 281
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 282
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 283
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_0

    move v8, v9

    :goto_1
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_1

    move v8, v9

    :goto_2
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 285
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 286
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 287
    .local v7, voiceSettings:I
    if-nez v7, :cond_2

    move v8, v10

    :goto_3
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 290
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 292
    const-string v8, "RILJ"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Samsung magic = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v11}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_3

    move v8, v9

    :goto_4
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 294
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 295
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 296
    .local v2, np:I
    invoke-static {v2}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 297
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 298
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 299
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 300
    .local v6, uusInfoPresent:I
    if-ne v6, v9, :cond_4

    .line 301
    new-instance v8, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v8}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 302
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 303
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 304
    invoke-virtual {p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v5

    .line 305
    .local v5, userData:[B
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v8, v5}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 306
    const-string v8, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v10

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v12, 0x2

    iget-object v13, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    array-length v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v8, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLogv(Ljava/lang/String;)V

    .line 309
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Incoming UUS : data (string)="

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v11, Ljava/lang/String;

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLogv(Ljava/lang/String;)V

    .line 311
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Incoming UUS : data (hex): "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v11, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v11}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v11

    invoke-static {v11}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLogv(Ljava/lang/String;)V

    .line 318
    .end local v5           #userData:[B
    :goto_5
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v11, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v8, v11}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 320
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    iget-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v8, :cond_5

    .line 323
    iget-object v8, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 324
    const-string v8, "InCall VoicePrivacy is enabled"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    .line 277
    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .end local v2           #np:I
    .end local v6           #uusInfoPresent:I
    .end local v7           #voiceSettings:I
    :cond_0
    move v8, v10

    .line 283
    goto/16 :goto_1

    :cond_1
    move v8, v10

    .line 284
    goto/16 :goto_2

    .restart local v7       #voiceSettings:I
    :cond_2
    move v8, v9

    .line 287
    goto/16 :goto_3

    :cond_3
    move v8, v10

    .line 293
    goto/16 :goto_4

    .line 314
    .restart local v2       #np:I
    .restart local v6       #uusInfoPresent:I
    :cond_4
    const-string v8, "Incoming UUS : NOT present!"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_5

    .line 326
    :cond_5
    iget-object v8, p0, Lcom/android/internal/telephony/SamsungBCMRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 327
    const-string v8, "InCall VoicePrivacy is disabled"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/SamsungBCMRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_6

    .line 331
    .end local v0           #dc:Lcom/android/internal/telephony/DriverCall;
    .end local v2           #np:I
    .end local v6           #uusInfoPresent:I
    .end local v7           #voiceSettings:I
    :cond_6
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 333
    return-object v4
.end method
