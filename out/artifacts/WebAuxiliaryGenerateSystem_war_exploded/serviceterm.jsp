<%--
  Created by IntelliJ IDEA.
  User: AlbusDumbledore
  Date: 2019/2/15 0015
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服务条款 - WebRamber</title>
    <link rel="shortcut icon" href="./img/favicon48.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./script/layui/css/layui.css">
    <style>
        /** 滚动条 **/
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        ::-webkit-scrollbar-button:vertical {
            display: none;
        }

        ::-webkit-scrollbar-track, ::-webkit-scrollbar-corner {
            background-color: #e2e2e2;
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 0;
            background-color: rgba(0, 0, 0, .3);
        }

        ::-webkit-scrollbar-thumb:vertical:hover {
            background-color: rgba(0, 0, 0, .35);
        }

        ::-webkit-scrollbar-thumb:vertical:active {
            background-color: rgba(0, 0, 0, .38);
        }
    </style>
</head>
<body style="background-color: #ffffff;margin: 0;padding: 0">
<%--导航栏开始--%>
<div class="layui-row" style="background-color: #ffffff;height: 3rem">
    <%--左上角logo开始--%>
    <div class="layui-col-md5" style="height: 100%">
        <div style="width: 2px;height: 24%"></div>
        <a href="./index.jsp">
            <img src="./img/index/logo.png" style="height:60%;margin-left: 1.6%">
        </a>
    </div>
    <%--左上角logo结束--%>
</div>
<%--导航栏结束--%>

<%--正文开始--%>
<div style="background-color: #f0f0f0;margin-top: 0.75rem;width: 100%;padding-top: 1rem;height: 590%">
    <div style="width: 70%;margin-left: 15%;background-color: white;padding-top: 1rem;padding-bottom: 1.5rem;box-shadow: 0px 1px 4px #DCDCDC">
        <h2 style="width: 100%;text-align: center;font-size: 1.3rem;color: #555">
            <b>服 务 条 款</b>
        </h2>
        <p style="margin-top: 2rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            更新日期：2018年6月
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            欢迎来到WebRamber！
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            WebRamber是由XXXX有限公司（下称“XXXX”）提供的互联网软件服务。本服务条款（下称“服务条款”）是您与XXXX之间关于您（“您”或“用户”）访问和使用WebRamber以及XXXX提供的其他服务（下称“服务”）的主要协议。您注册、登录WebRamber和/或使用XXXX提供的服务，即表示您同意接受服务条款，如您不同意该协议，请不要使用本服务。因此，敬请仔细阅读。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX有权不时地对服务条款做任何修改和补充，并在WebRamber网站上公布。服务条款的修改和补充将在公布时立即生效。您继续访问和使用WebRamber即视为您接受修订后的服务条款。如您不同意修订后的服务条款，您应停止访问WebRamber并拒绝使用服务或删除您在WebRamber上的信息和帐户来终止接受服务。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            如果您代表某个机构而非您个人注册、登录和使用WebRamber和/或我们其他的服务，则您将被认为获得充分授权代表该机构同意本服务条款以及不时修订和补充的服务条款。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            1.服务内容
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            WebRamber的具体服务由XXXX根据实际情况提供，例如、个人信息分享以及在线评论、在线协作等服务。依托于互联网实现了用户间的协作和共享。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            为不断提升用户体验，XXXX会不时为用户提供其他服务内容，届时，可能与您另行签订其他专项协议。但即使未另行签订其他专项协议，您使用WebRamber的具体服务时，也将被视为您同意XXXX关于该等具体服务的任何要求。如果其他专项协议和本条款之间存在冲突，应以其他专项协议为准，但以该冲突和与该协议特定事宜相关为限。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX保留随时变更、中止或终止免费服务的权利，并保留根据实际情况随时调整WebRamber提供的服务种类、形式的权利。XXXX不承担因WebRamber提供的任何免费服务的调整给您造成的损失。尽管有本条约定，XXXX有权在未来恰当的时机对该等免费服务内容收取相应的服务费用。XXXX保留随时终止向您提供的收费服务的权利，并保留根据实际情况随时调整WebRamber提供的收费服务种类和形式的权利。如果XXXX终止提供某项收费服务，XXXX的义务仅在于向您返还您尚未使用的服务期对应的部分费用。但无论如何，XXXX将尽合理的努力为您预留合理的时间以便您为该等服务的变更、中止或终止做出应对。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            2.注册
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            为了能访问WebRamber和使用服务，您同意以下事项：依WebRamber网站提示填写准确的、真实的注册邮箱、密码和名称，并确保今后更新的登录邮箱、名称、头像等资料的有效性和合法性。若您提供任何违法、虚假、不道德或XXXX认为不适合在WebRamber上展示的资料；或者XXXX有理由怀疑您的资料属于病毒程序或恶意操作；或者您违反本服务条款的规定；或者未经XXXX同意，将WebRamber用于商业目的，XXXX有权暂停或终止您的帐号，并拒绝您于现在和未来使用服务之全部或任何部分。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            尽管有前述规定，XXXX无义务对任何用户的任何登记资料承担任何责任，包括但不限于鉴别、核实任何登记资料的真实性、准确性、完整性、适用性及/或是否为最新资料的责任。同时，XXXX建议您妥善保管您的注册邮箱、密码和名称，准确输入该等信息将作为您访问登录WebRamber并享有服务的关键环节。如果您发现有人未经授权使用您的帐户信息或怀疑任何人在未经授权的情况下，能够访问您的私有内容，您应立即更改密码，并向我们反馈。如果您提供的信息不正确或您未能确保您的帐户信息的安全而造成任何损失或损害，XXXX不承担任何责任。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            3.内容发布以及使用权
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            3.1内容的发布
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户在WebRamber上发布的内容（包含但不限于WebRamber目前各产品功能里的内容）仅表明其个人的立场和观点，并不代表XXXX的立场或观点。作为内容的发布者，您对在本平台上传、发布的内容承担全部责任，与XXXX无关。XXXX无法控制经由本平台上传、发布的内容，因此不保证上传、发布的内容的正确性、合法性、安全性、完整性。尽管XXXX有权对您上传至WebRamber的数字作品进行审核，但该审核仅限于形式审核，不对您上传的内容作任何实质性审核，且XXXX的上述审核行为不视为XXXX对于您使用本平台所上传、发布的内容承担任何保证责任。如您使用本平台长传的内容违反法律规定或侵害到其他人合法权益导致任何第三人提出索赔的， 均由您独立承担全部法律责任。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            如若XXXX有理由认为您使用本服务的行为违反法律规定或有任何第三方通知XXXX您使用本服务的行为侵犯其合法权益的，XXXX有权暂停或终止您使用本服务的全部或部分，即便您使用本服务的行为有可能最终未被有管辖权的司法机构认定为非法或侵犯任何第三方的合法权益。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            您认为其他用户在WebRamber上发表的内容侵犯您的合法权利，您有权向XXXX提交书面通知（该书面通知应当包含下列内容：（一）您的姓名、联系方式和地址；（二）要求删除或者断开链接的内容的名称和网络地址；（三）构成侵权的初步证明材料；（四）对侵权行为的简要描述。如果您代表所属单位、机构，还请提交委托证明；该书面通知包含的每页内容您均应亲笔签名或加盖公司印章，您可以将上述书面通知的电子扫描件文档发送至XXXX指定电子邮箱【support@webramber.com 】
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX将在收到您提交的书面通知后下架您在书面通知书里要求取消公开的涉嫌侵权的内容或断开与该等涉嫌侵权内容的链接并将您的通知书的内容通过邮件的方式转送给涉嫌侵权的版权方，即为XXXX履行完毕向涉嫌侵权的版权方转送该通知书的义务。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            如本款上述涉嫌侵权的版权方认为XXXX依据您的通知书删除或断开链接的涉嫌侵权的内容未侵犯他人权利的，其有权向XXXX提交书面说明，要求恢复被下架的内容或者恢复与被断开的内容的链接，XXXX将在接到其书面说明后恢复被下架的内容或者恢复与被断开的内容的链接，同时将该书面说明通过邮件的方式转送给您。XXXX上述下架内容与恢复内容的行为是在用户的申请下进行的，并非XXXX独立做出的相关决定，关于侵权方与被侵权方之间的纠纷，由双方独立解决，XXXX作为平台方仅负有沟通、协调的义务，不承担双方之间的任何侵权责任。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户不得使用WebRamber服务发送或传播敏感信息和违反国家法律制度的信息，包括但不限于下列信息：
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (1) 反对宪法所确定的基本原则的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (3) 损害国家荣誉和利益的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (4) 煽动民族仇恨、民族歧视，破坏民族团结的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (5) 破坏国家宗教政策，宣扬邪教和封建迷信的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (6) 散布谣言，扰乱社会秩序，破坏社会稳定的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (8) 侮辱或者诽谤他人，侵害他人合法权益的；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            (9) 含有法律、行政法规禁止的其他内容的。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户承诺发表言论要：爱国、守法、自律、真实、文明。不传播任何非法的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、危害国家安全的、泄露国家机密的、破坏国家宗教政策和民族团结的以及其它违反法律法规及政策的内容。若用户的行为不符合以上提到的服务条款，WebRamber将作出独立判断立即暂停或终止用户的服务帐号。用户需对自己在网上的行为承担法律责任，WebRamber不承担任何法律责任及连带责任。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            关于付费模板的发布，请参照【付费模板协议】
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            3.2 内容的使用权
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户将文件发布并公开到WebRamber后，即视为永久授权WebRamber使用，并授权XXXX将文件通过互联网及/或移动互联网面向全球用户进行发布、推广以及传播，以及以任何合法方式将文件用于对WebRamber平台的宣传、推广。若用户上传的文件涉及到个人隐私及商业秘密应在文件中予以注明，对于未注明的，视为未涉及个人隐私及商业秘密，WebRamber可以不做任何标记直接用于宣传及推广展示使用，若因此发生纠纷，WebRamber不承担任何法律责任。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            WebRamber平台的模板使用，无论是使用平台自有模板，还是其他用户上传的付费模板，任何时候您均不得将通过前述服务获得的有权使用的模板的任何部分或全部以转授权、分授权或其他任何方式免费的或收费的提供给他人（包括自然人及具备或不具备法人主体资格的机构、组织）使用，亦不得利用有权使用的数字作品的任何部分或全部以销售、租赁或变相销售、租赁或其他类似的方式牟利。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            4.版权
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            WebRamber的外观设计、计算机代码与专利等均归XXXX所有。未经XXXX事先书面许可，您不能复制、拷贝、或者使用任何部分的代码和外观设计。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            5.隐私政策
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            使用WebRamber和XXXX提供的服务，即表示您同意XXXX合法收集和使用有关您及您所使用服务的技术性或诊断性信息。收集到的这些信息将用于改进WebRamber产品的内容和技术，提升WebRamber的服务品质。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX不会将您的信息和内容提供或出售给其他的组织或个人，但以下情况除外：
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （1）您的事先同意或授权，或您于WebRamber上主动与第三方进行分享操作；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （2）司法机关或有权政府机构或任何法律法规部门规章要求XXXX提供该等信息；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （3）您违反了本服务条款，且XXXX需要向第三方提供的。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            6.数据安全
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX将尽合理的努力保护您的信息安全，并为此采取合理的数据传输、存储、转换等预防保护措施。但是，互联网数据传输、存储、转换均可能存在一定未知且不确定的数据安全风险，该等风险将导致包括但不限于数据丢失、泄露、损坏、无法读取或提取等后果。您确认，您已明确知晓并同意接受该等因互联网引发的风险和后果，并已采取恰当的措施（例如数据备份等），以便在该等风险发生时将损失降至最低。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            因互联网技术本身等非XXXX主观故意或重大过失导致危害您数据安全的，XXXX不承担任何赔偿责任。因XXXX重大过失危害您数据安全的，XXXX的赔偿责任以向您收取的服务费用为上限。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            7.免责声明
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            一旦您注册成为用户即表示您与XXXX达成协议，完全接受本服务条款项下的全部条款。对免责声明的解释、修改及更新权均属于XXXX所有。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （1）由于您将用户密码告知他人或与他人共享注册帐户，由此导致的任何个人信息的泄漏，或其他非因XXXX原因导致的个人信息的泄漏，XXXX不承担任何法律责任；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （2）任何第三方根据XXXX各服务条款及声明中所列明的情况使用您的个人信息，由此所产生的纠纷，XXXX不承担任何法律责任以及连带责任；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （3）任何由于黑客攻击、电脑病毒侵入或政府管制而造成的暂时性网站关闭，XXXX不承担任何法律责任；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （4）我们鼓励用户充分利用WebRamber自由地发布和共享自己的信息。您可以自由发布文字、图片等内容，但这些内容必须位于公共领域内，或者您拥有这些内容的使用权。同时，用户不应在自己的个人主页或WebRamber的任何其他地方发布受版权保护的内容；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （5）用户在WebRamber发布侵犯他人知识产权或其他合法权益的内容，XXXX有权予以删除，并保留移交司法机关处理的权利；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （6）用户对于自己创作并在WebRamber上发布的合法作品依法享有著作权及其他相关权利；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （7）互联网是一个开放平台，用户将图片等资料上传到互联网上，有可能会被其他组织或个人复制、转载、擅改或做其它非法用途，用户必须充分意识到此类风险的存在。用户明确同意使用XXXX服务所存在的风险将完全由用户自己承担；因用户使用XXXX服务而产生的一切后果也由用户自己承担，XXXX对用户不承担任何责任。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            8.服务变更/中断/终止
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            如因系统维护或升级的需要而暂停网络服务、调整服务功能的，XXXX将尽可能事先在网站上进行通告。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            如发生下列任何一种情形，XXXX有权单方面中断或终止向用户提供服务而无需通知用户：
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （1）用户提供的个人资料不真实；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （2）用户违反本服务条款中规定的使用规则；
        </p>
        <p style="margin-top: 0.1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            （3）未经XXXX同意，将WebRamber用于商业目的。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            9.服务条款的完善和修改
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            XXXX有权根据互联网行业变化以及有关法律、法规的颁布、修订，不时地完善和修改XXXX服务条款。XXXX保留随时修改服务条款的权利，用户在使用XXXX的服务时，有必要对XXXX最新的服务条款进行仔细阅读和重新确认，当发生相关争议时，以最新的服务条款为准。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            10.特别约定
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            本服务条款及其下的服务受中华人民共和国法律管辖，并按之解释。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方合法权益的情形，XXXX有权直接删除该等违反规定的信息，并可以暂停或终止向该用户提供服务。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            若用户利用本服务从事任何违法或侵权行为，由用户自行承担全部责任，XXXX不承担任何法律责任及连带责任。因此给XXXX或任何第三方造成任何损失的，用户应负责全额赔偿。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            用户在此特别声明并承诺，用户已充分注意本服务协议内免除或限制XXXX责任的条款，用户完全知晓并理解该等条款的规定并同意接受。
        </p>
        <h2 style="width: 100%;font-size: 1.1rem;color: #555;margin-top: 1rem;margin-left: 1.2rem;margin-right: 1.2rem">
            11.联系我们
        </h2>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            欢迎您对我们的服务条款提出意见。如有任何问题、意见或疑虑，请发邮件至support@webramber.com 此电子邮件地址作为本服务条款的组成部分可能会不时进行更新。
        </p>
        <p style="margin-top: 1rem;text-indent: 1.8rem;font-size: 0.9rem;margin-left: 1.2rem;margin-right: 1.2rem">
            ©XXXX有限公司保留一切权利。
        </p>
    </div>
    <p style="width: 100%;text-align: center;font-size: 1.2rem;color: #555;margin-top: 4rem">
        WenRamber，简易生成网页，实时修改
    </p>
    <div style="width: 100%;margin-top: 1.3rem">
        <span style="margin-top: 3rem;text-align: center;width: 40%;margin-left: 40%;color: #333">
            <a href="./index.jsp">首页</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">推荐</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">关于我们</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
            <a href="">服务条款</a>
        </span>
    </div>
    <div style="width: 100%;margin-top: 1.3rem;color: #777">
        <div style="width: 50%;float: left">
            <div style="margin-left: 50%">联系方式 : QQ1627707178</div>
            <div style="margin-left: 50%;margin-top: 1.1rem">邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱 : <a>support@webramber.com</a></div>
            <div style="margin-left: 50%;margin-top: 1.1rem">电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话 : <a>13672222492</a></div>
            <div style="margin-left: 50%;margin-top: 1.1rem">江西XXXX有限公司&nbsp©2019&nbsp赣ICP备00000000号-0</div>
        </div>
        <div style="width: 40%;float: left">
            <img src="img/index/2Dcode.png" style="height: 6rem;margin-left: 40%">
            <div style="color: black;margin-left: 43.5%;margin-top: 0.4rem">关注微信</div>
        </div>
    </div>
</div>
<%--正文结束--%>
</body>
<script src="./srcipt/layui/layui.js"></script>
</html>

