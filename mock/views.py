import json
from datetime import datetime
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q,Sum
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render
from mock.models import *
from mock.emotion import *
import speech_recognition as sr
from mock.knn import predict
from mock.test import *
def main(request):
    return render(request,'logindex.html')
def logout(request):
    auth.logout(request)
    return render(request,'logindex.html')
def login1(request):
    try:
        uname=request.POST['textfield']
        pwd=request.POST['textfield2']
        ob=login.objects.get(username=uname,password=pwd)
        if ob.type == 'admin':
            ob1=auth.authenticate(username='admin',password='admin')
            if ob1 is not None:
                auth.login(request,ob1)
            return HttpResponse('''<script>alert("success");window.location="/adminhm"</script>''')
        elif ob.type == 'guide':
            request.session['lid']=ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("success");window.location="/guidehm"</script>''')
        elif ob.type == 'company':
            request.session['lid']=ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("success");window.location="/cmphm"</script>''')
        else:
            return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')
@login_required(login_url='/')
def adminhm(request):
    return render(request,'admin/adminhm.html')

@login_required(login_url='/')
def cmphm(request):
    return render(request,'company/cmphm.html')

@login_required(login_url='/')
def mnguser(request):
    ob=user.objects.all()
    return render(request,'admin/users.html',{'val':ob})
@login_required(login_url='/')
def mng_guide(request):
    ob=guide.objects.all()
    return render(request,'admin/mng_guide.html',{'val':ob})
def cmpny(request):
    return render(request,'cmpny.html')
@login_required(login_url='/')
def add_guide(request):
    return render(request,'admin/add_guide.html')
def cmpny2(request):
    name=request.POST['textfield']
    plc=request.POST['textfield2']
    webst=request.POST['textfield3']
    phone=request.POST['textfield5']
    email=request.POST['textfield6']
    uname=request.POST['textfield7']
    pwd=request.POST['textfield8']
    ob=login()
    ob.username=uname
    ob.password=pwd
    ob.type='pending'
    ob.save()
    ob1=company()
    ob1.name=name
    ob1.place=plc
    ob1.website=webst
    ob1.phone=phone
    ob1.email=email
    ob1.LOGIN=ob
    ob1.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/"</script>''')
@login_required(login_url='/')
def add_guide2(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    address=request.POST['textfield3']
    phone=request.POST['textfield5']
    email=request.POST['textfield6']
    uname=request.POST['textfield7']
    pwd=request.POST['textfield8']
    ob=login()
    ob.username=uname
    ob.password=pwd
    ob.type='guide'
    ob.save()
    ob1=guide()
    ob1.fname=fname
    ob1.lname=lname
    ob1.address=address
    ob1.phone=phone
    ob1.email=email
    ob1.LOGIN=ob
    ob1.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/mng_guide"</script>''')
@login_required(login_url='/')
def mnguser2(request):
    name=request.POST['t1']
    ob=user.objects.filter(fname__icontains=name)
    print(ob,"===================")
    return render(request,'admin/users.html',{'val':ob})
@login_required(login_url='/')
def dltgd(request,id):
    ob=guide.objects.get(LOGIN__id=id)
    ob.delete()
    ob1=login.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("deleted...!!");window.location="/mng_guide"</script>''')
@login_required(login_url='/')
def dltqst(request,id):
    ob1=questions.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("deleted...!!");window.location="/mng_qstn"</script>''')
@login_required(login_url='/')
def dltvac(request,id):
    ob1=vaccancy.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("deleted...!!");window.location="/mvac"</script>''')
@login_required(login_url='/')
def guide_bub(request):
    ob = guide.objects.all()
    return render(request, 'admin/ublock.html', {'val': ob})
@login_required(login_url='/')
def vcmp(request):
    ob = complaint.objects.all()
    return render(request, 'admin/vcmp.html', {'val': ob})
@login_required(login_url='/')
def vcmpny(request):
    ob = company.objects.all()
    return render(request, 'admin/vcmny.html', {'val': ob})
@login_required(login_url='/')
def vdbt(request):
    ob = doubts.objects.filter(GUIDE__LOGIN__id=request.session['lid'])
    return render(request,'guide/vdbt.html',{'val': ob})
@login_required(login_url='/')
def vrev(request):
    ob = reviews.objects.all()
    return render(request, 'admin/rev.html', {'val': ob})
@login_required(login_url='/')
def rply(request,id):
    request.session['cid']=id
    return render(request, 'admin/rply.html')
@login_required(login_url='/')
def rply2(request):
    rply=request.POST['textarea']
    ob=complaint.objects.get(id=request.session['cid'])
    ob.reply=rply
    ob.save()
    return HttpResponse('''<script>alert("sending...!!");window.location="/vcmp"</script>''')
@login_required(login_url='/')
def drply(request,id):
    request.session['cid']=id
    return render(request, 'guide/drply.html')
@login_required(login_url='/')
def drply2(request):
    rply=request.POST['textarea']
    ob=doubts.objects.get(id=request.session['cid'])
    ob.reply=rply
    ob.save()
    return HttpResponse('''<script>alert("sending...!!");window.location="/vdbt"</script>''')
@login_required(login_url='/')
def blockuser(request,id):
    ob=login.objects.get(id=id)
    ob.type='block'
    ob.save()
    return HttpResponse('''<script>alert("blocked...!!");window.location="/guide_bub"</script>''')
@login_required(login_url='/')
def unblockuser(request,id):
    ob=login.objects.get(id=id)
    ob.type='guide'
    ob.save()
    return HttpResponse('''<script>alert("unblocked...!!");window.location="/guide_bub"</script>''')
@login_required(login_url='/')
def accept(request,id):
    ob=login.objects.get(id=id)
    ob.type='company'
    ob.save()
    return HttpResponse('''<script>alert("Accepted...!!");window.location="/vcmpny"</script>''')
@login_required(login_url='/')
def reject(request,id):
    ob=login.objects.get(id=id)
    ob.type='rejected'
    ob.save()
    return HttpResponse('''<script>alert("Rejected...!!");window.location="/vcmpny"</script>''')
@login_required(login_url='/')
def acceptreq(request,id):
    ob=app_req.objects.get(id=id)
    ob.status='accepted'
    ob.save()
    return HttpResponse('''<script>alert("Accepted...!!");window.location="/req"</script>''')
@login_required(login_url='/')
def rejectreq(request,id):
    ob=app_req.objects.get(id=id)
    ob.status='rejected'
    ob.save()
    return HttpResponse('''<script>alert("Rejected...!!");window.location="/req"</script>''')
###########################################################################################################
@login_required(login_url='/')
def guidehm(request):
    return render(request,'guide/guidehm.html')
@login_required(login_url='/')
def mng_test(request):
    ob=test.objects.filter(GUIDE__LOGIN__id=request.session['lid'])
    return render(request,'guide/mtest.html',{'val':ob})
@login_required(login_url='/')
def addvac(request):
    return render(request,'company/vac.html')
@login_required(login_url='/')
def vac(request):
    job=request.POST['textfield']
    vacc=request.POST['textfield2']
    qual=request.POST['textfield3']
    exp=request.POST['textfield4']
    slry=request.POST['textfield5']
    det=request.POST['textfield6']
    ob=vaccancy()
    ob.job=job
    ob.vacncy=vacc
    ob.qualif=qual
    ob.exp=exp
    ob.salary=slry
    ob.det=det
    ob.COMPANY=company.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/mvac"</script>''')
@login_required(login_url='/')
def add_test(request):
    return render(request,'guide/add_test.html')
@login_required(login_url='/')
def add_qtn1(request):
    tp=request.POST['slt']
    qtn=request.POST['textfield']
    opt1=request.POST['textfield2']
    opt2=request.POST['textfield3']
    opt3=request.POST['textfield4']
    opt4=request.POST['textfield5']
    ans=request.POST['textfield6']
    ob=questions()
    ob.question=qtn
    ob.op1=opt1
    ob.op2=opt2
    ob.op3=opt3
    ob.op4=opt4
    ob.ans=ans
    ob.TEST=test.objects.get(id=tp)
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/mng_qstn"</script>''')
@login_required(login_url='/')
def add_test2(request):
    exam1=request.POST['textfield']
    vac=request.POST['textfield2']
    date=request.POST['textfield3']
    ob=test()
    ob.exam=exam1
    ob.vaccancy=vac
    ob.date=date
    ob.GUIDE=guide.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/mng_test"</script>''')
@login_required(login_url='/')
def addtips2(request):
    tips1=request.POST['t1']
    det=request.POST['t2']
    ob=tips()
    ob.tip=tips1
    ob.details=det
    ob.GUIDE=guide.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/guidehm"</script>''')
@login_required(login_url='/')
def dltst(request,id):
    ob1=test.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("deleted...!!");window.location="/mng_test"</script>''')

@login_required(login_url='/')
def dltcpqst(request,id):
    ob1=vac_qn.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("deleted...!!");window.location="/mcqn"</script>''')

@login_required(login_url='/')
def mng_qstn(request):
    ob=questions.objects.all()
    return render(request,'guide/mQTN.html',{'val':ob})
@login_required(login_url='/')
def mvac(request):
    ob=vaccancy.objects.filter(COMPANY__LOGIN__id=request.session['lid'])
    return render(request,'company/mvac.html',{'val':ob})
@login_required(login_url='/')
def addqstn(request):
    ob=test.objects.all()
    return render(request,'guide/addqtn.html',{'v':ob})
@login_required(login_url='/')
def grev(request):
    ob = reviews.objects.filter(LOGIN__id=request.session['lid'])
    return render(request, 'guide/rev.html', {'val': ob})
@login_required(login_url='/')
def addtips(request):
    return render(request, 'guide/tips.html')
@login_required(login_url='/')
def gline(request):
    return render(request, 'company/gline.html')
@login_required(login_url='/')
def gline2(request):
    tips1=request.POST['t1']
    det=request.POST['t2']
    ob=guidelines()
    ob.guidelines=tips1
    ob.details=det
    ob.COMPANY=company.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/cmphm"</script>''')
@login_required(login_url='/')
def addd2(request):
    vac=request.POST['slt']
    qtn=request.POST['textfield']
    ans=request.POST['textfield2']
    ob=vac_qn()
    ob.question=qtn
    ob.ans=ans
    ob.VACCANCY=vaccancy.objects.get(id=vac)
    ob.save()
    return HttpResponse('''<script>alert("success...!!");window.location="/mcqn"</script>''')
@login_required(login_url='/')
def vuser(request):
    ob=user.objects.all()
    return render(request,'company/users.html',{'val':ob})
@login_required(login_url='/')
def mcqn(request):
    ob=vac_qn.objects.all()
    ob1=vaccancy.objects.all()
    return render(request,'company/mqtn.html',{'val':ob,'v':ob1})
@login_required(login_url='/')
def addcpqstn(request):
    btn=request.POST['Submit']
    vac=request.POST['slt']
    if btn == "SEARCH":
        ob = vac_qn.objects.filter(VACCANCY__id=vac)
        ob1=vaccancy.objects.all()
        return render(request, 'company/mqtn.html', {'val': ob, 'v': ob1,'vac':int(vac)})
    else:
        ob1=vaccancy.objects.all()
        return render(request,'company/addqtn.html',{'v': ob1})


@login_required(login_url='/')
def req(request):
    ob=app_req.objects.all()
    return render(request,'company/req.html',{'val':ob})
@login_required(login_url='/')
def chatwithuser(request):
    ob = user.objects.all()
    return render(request,"company/fur_chat.html",{'val':ob})
@login_required(login_url='/')
def chatview(request):
    ob = user.objects.all()
    d=[]
    for i in ob:
        r={"name":i.fname,'email':i.email,'loginid':i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)
@login_required(login_url='/')
def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=chat()
    ob.fid=login.objects.get(id=request.session['lid'])
    ob.tid=login.objects.get(id=id)
    ob.msg=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.time=datetime.today()
    ob.save()
    return JsonResponse({"task":"ok"})
    # refresh messages chatlist

@login_required(login_url='/')
def coun_msg(request,id):
    ob1=chat.objects.filter(fid__id=id,tid__id=request.session['lid'])
    ob2=chat.objects.filter(fid__id=request.session['lid'],tid__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.fid.id,"msg":i.msg,"date":i.date,"chat_id":i.id})
    obu=user.objects.get(LOGIN__id=id)
    return JsonResponse({"data":res,"name":obu.fname,"user_lid":obu.LOGIN.id})
# Create your views here.
############################################################################################
def login2(request):
    username=request.POST['uname']
    password=request.POST['pass']
    ob=login.objects.get(username=username,password=password)
    if ob is None:
        data={"task":"invalid"}
    else:
        data={"task":"success",'id':str(ob.id)}
    r=json.dumps(data)
    print(r)
    return HttpResponse(r)

def Userregistration(request):
    firstname=request.POST['fname']
    lastname = request.POST['lname']
    plc = request.POST['plc']
    pst = request.POST['post']
    pin = request.POST['pin']
    ph = request.POST['ph']
    username= request.POST['un']
    password=request.POST['pwd']
    gen=request.POST['gen']
    email=request.POST['email']
    lob = login()
    lob.username = username
    lob.password = password
    lob.type='user'
    lob.save()
    ob = user()
    ob.LOGIN = lob
    ob.fname = firstname
    ob.lname=lastname
    ob.gender=gen
    ob.place = plc
    ob.post = pst
    ob.pin = pin
    ob.phone = ph
    ob.email=email
    ob.save()
    data={"task":"success"}
    r=json.dumps(data)
    return HttpResponse(r)
def view_dbt_reply(request):
    id = request.POST['lid']
    ob = doubts.objects.filter(USER__LOGIN__id=id)
    data = []
    for i in ob:
        row = {"doubt": i.dbts, "reply": i.reply, "date":str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_gd(request):
    ob = guide.objects.all()
    data = []
    for i in ob:
        row = {"guide": i.fname+" "+i.lname, "gid": i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_cp(request):
    ob = company.objects.all()
    data = []
    for i in ob:
        row = {"cmp": i.name, "cid": i.id,"lid":i.LOGIN.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_comp_reply(request):
    id = request.POST['lid']
    ob = complaint.objects.filter(USER__LOGIN__id=id)
    data = []
    for i in ob:
        row = {"complaint": i.comp, "reply": i.reply, "date":str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def sendcomp(request):
    complaints=request.POST['comp']
    lid=request.POST['lid']
    ob=complaint()
    ob.comp= complaints
    ob.date=datetime.today()
    ob.reply='pending'
    ob.USER=user.objects.get(LOGIN__id=lid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def read_pdf(file_path):
    import PyPDF2
    with open(file_path, 'rb') as file:
        reader = PyPDF2.PdfReader(file)
        num_pages = len(reader.pages)
        txt=""
        for page_number in range(num_pages):
            page = reader.pages[page_number]
            text = page.extract_text()
            txt=txt+text+" "
        return txt
def upldcv(request):
    cv=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(cv.name,cv)
    lid=request.POST['lid']
    save_image_path = './media/' + fs
    resume_text = read_pdf(save_image_path)
    res = predict(resume_text)
    print(res,"=================================================")
    ob=uplds()
    ob.USER=user.objects.get(LOGIN__id=lid)
    ob.cv=fs
    ob.date=datetime.today()
    ob.save()
    data = {"task": "success","res":res}
    r = json.dumps(data)
    return HttpResponse(r)
def senddbt(request):
    dbt=request.POST['dbt']
    lid=request.POST['lid']
    gid=request.POST['gid']
    ob=doubts()
    ob.dbts= dbt
    ob.date=datetime.today()
    ob.reply='pending'
    ob.USER=user.objects.get(LOGIN__id=lid)
    ob.GUIDE=guide.objects.get(id=gid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def view_tips(request):
    gid=request.POST['gid']
    ob = tips.objects.filter(GUIDE__id=gid)
    data = []
    for i in ob:
        row = {"tips": i.tip,"det": i.details}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def career_prediction(request):
    job=request.POST['job']
    print(job)
    ob=vaccancy.objects.filter(job__icontains=job)
    data = []
    for i in ob:
        row = {"cmp": i.COMPANY.name,"job":i.job,"vac":i.vacncy,"qual":i.qualif,"exp":i.exp,"sal":i.salary,"det":i.det}
        data.append(row)
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)
def mocktest(request):
    ob=vaccancy.objects.all()
    data = []
    for i in ob:
        row = {"cmp": i.COMPANY.name,"job":i.job,"vac":i.vacncy,"qual":i.qualif,"exp":i.exp,"sal":i.salary,"det":i.det,"cid":i.id}
        data.append(row)
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)
def test_result(request):
    cid = request.POST['gid']
    lid = request.POST['lid']
    op=user.objects.get(LOGIN__id=lid)
    from django.db import connection
    cursor = connection.cursor()
    cursor.execute("SELECT SUM(`mock_test_res`.res),`mock_test`.`exam`,`mock_test`.`vaccancy` FROM `mock_test_res` JOIN `mock_questions` ON `mock_test_res`.`QUESTIONS_id`=`mock_questions`.id JOIN `mock_test` ON `mock_test`.`id`=`mock_questions`.`TEST_id` WHERE`mock_questions`.`TEST_id`=%s AND `mock_test_res`.`USER_id`=%s",[cid,op.id])
    ob=cursor.fetchall()
    print(ob,"=====")
    data = []
    for i in ob:
        row = {"job": i[1], "vac":i[2],"res": i[0]}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def result(request):
    cid = request.POST['gid']
    lid = request.POST['lid']
    op=user.objects.get(LOGIN__id=lid)
    from django.db import connection
    cursor = connection.cursor()
    cursor.execute("SELECT SUM(`mock_answer_details`.`ans`),`mock_vaccancy`.`job` FROM `mock_answer_details` JOIN `mock_vaccancy` ON `mock_answer_details`.`VAC_QN_id`=`mock_vaccancy`.id WHERE `mock_vaccancy`.`COMPANY_id`=%s and `mock_answer_details`.`USER_id`=%s GROUP BY `mock_vaccancy`.`id`",[cid,op.id])
    ob=cursor.fetchall()
    print(ob,"=====")
    # ob = answer_details.objects.filter(VAC_QN__VACCANCY__COMPANY__id=cid).annotate(sum=Sum("ans")).values('date','sum').distinct()
    # print(ob,"=========")
    data = []
    for i in ob:
        row = {"job": i[1], "res": i[0]}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def view_exam(request):
    gid=request.POST['gid']
    ob = test.objects.filter(GUIDE__id=gid)
    data = []
    for i in ob:
        row = {"exam": i.exam,"date": str(i.date),"vac":i.vaccancy,"tid":i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_test(request):
    ob = test.objects.all()
    data = []
    for i in ob:
        row = {"exam": i.exam,"date": str(i.date),"vac":i.vaccancy,"tid":i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_rules(request):
    cid=request.POST['gid']
    ob = guidelines.objects.filter(COMPANY__id=cid)
    data = []
    for i in ob:
        row = {"tips": i.guidelines,"det": i.details}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def in_message2(request):
    fromid = request.POST['fid']
    toid = request.POST['toid']
    message=request.POST['msg']
    ob=chat()
    ob.fid=login.objects.get(id=fromid)
    ob.tid=login.objects.get(id=toid)
    ob.msg=message
    ob.date=datetime.today()
    ob.time = datetime.today()
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)
    return HttpResponse(r)
def view_message2(request):
    fromid=request.POST['fid']
    toid=request.POST['toid']
    lmid = request.POST['lastmsgid']
    data1 = []
    ob=chat.objects.filter(Q(tid__id=toid,fid__id=fromid,id__gt=lmid)|Q(tid__id=fromid,fid__id=toid,id__gt=lmid)).order_by('id')
    for i in ob:
        row = {"fromid": i.fid.id,"date": str(i.date),"message":i.msg,"msgid":i.id}
        data1.append(row)
    r = json.dumps({'res1':data1})
    return HttpResponse(r)

def get_question(request):
    vid = request.POST['pid']
    ob = questions.objects.filter(TEST__id=vid)
    data = []
    for i in ob:
        row = {"qid": i.id, "question":i.question, "op1": i.op1, "op2": i.op2,"op3":i.op3,"op4":i.op4,"answer":i.ans}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def and_view_questions(request):
    test_id=request.POST['tid']
    ob = vac_qn.objects.filter(VACCANCY__id=test_id)
    data = []
    for i in ob:
        row = {"qid": i.id, "questions":i.question,"answers":i.ans}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def answertest(request):
    qid=request.POST['qid']
    lid = request.POST['lid']
    ans = request.POST['ans']
    res = request.POST['res']
    ob=test_res()
    ob.QUESTIONS=questions.objects.get(id=qid)
    ob.USER=user.objects.get(LOGIN__id=lid)
    ob.date=datetime.today()
    ob.res=res
    ob.ans=ans
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def mark(request):
    scid = request.POST['scid']
    mark = request.POST['mark']
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def voice(request):
        print("=================================heloooo======================================")
        scrid = request.POST['scid']
        lid = request.POST['lid']
        qid = request.POST['qid']
        tid = request.POST['tid']
        file = request.FILES['file']
        im = request.FILES['file1']
        fn=FileSystemStorage()
        image = fn.save(im.name,im)
        # image = secure_filename(im.filename)
        import time
        ffl = time.strftime("%Y%m%d_%H%M%S")
        reg = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
        kk = "pic.jpg"
        fn.save(os.path.join(r'C:\Users\00000\PycharmProjects\Mock_Interview\media\emotion', reg), im)
        ff = fn.save(file.name,file)
        # ff = secure_filename(file.filename)
        print(ff)
        fl = ff.split('.')
        # print(fl[1])
        # import time
        ffl = time.strftime("%Y%m%d_%H%M%S")
        req = time.strftime("%Y%m%d_%H%M%S") + "." + str(fl[1])
        fn.save(os.path.join(r'C:\Users\00000\PycharmProjects\Mock_Interview\media\audio', req),file)
        # fn.save(req,req)
        print(req, "++++++=====++++====+++")
        print("====ff1=====", ffl)
        os.system('ffmpeg -i static\\audio\\' + req + ' static\\audio\\' + ffl + ".wav")
        ans = "no answer"
        try:
            ans = silence_based_conversion(ffl)
        except:
            pass
        print("ans", ans)
        q = vac_qn.objects.get(id=qid)
        oans = q.ans
        print(oans)
        mark = 10

        sim = checkans(oans, ans)
        omark = sim * mark
        print("omark", omark)
        if omark != 0.0:
            my_matches = []  # my_tool.check(ans)
            print(len(my_matches))
            if len(my_matches) > 5 and len(my_matches) < 10:
                omark = omark - 0.3
            elif len(my_matches) > 10 and len(my_matches) < 20:
                omark = omark - 0.6
        em = detect_emotion(reg)
        print("emotion", em)
        qw = answer_details()
        qw.ans=ans
        qw.emot=em
        qw.USER=user.objects.get(LOGIN__id=lid)
        qw.oans=oans
        qw.date=datetime.today()
        qw.VAC_QN=vac_qn.objects.get(id=tid)
        qw.save()
        data = {"task": omark}
        r = json.dumps(data)
        return HttpResponse(r)

def silence_based_conversion(fl):
    path = r'./static/audio/'+fl+'.wav'
    r = sr.Recognizer()
    file=path
    # recognize the chunk
    with sr.AudioFile(file) as source:
        r.adjust_for_ambient_noise(source)
        audio_listened = r.listen(source)
    try:
        rec = r.recognize_google(audio_listened)
        print(rec)
        return rec
    except sr.UnknownValueError as e:
        print("Could not understand audio")
        print(e)
        return "na"
    except sr.RequestError as e:
        print("Could not request results. check your internet connection")
        print(e)
        return "na"
