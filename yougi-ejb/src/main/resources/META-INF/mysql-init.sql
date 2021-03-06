# Yougi is a web application conceived to manage user groups or
# communities focused on a certain domain of knowledge, whose members are
# constantly sharing information and participating in social and educational
# events. Copyright (C) 2011 Ceara Java User Group - CEJUG.
#
# This application is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation; either version 2.1 of the License, or (at your
# option) any later version.
#
# This application is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
# License for more details.
#
# There is a full copy of the GNU Lesser General Public License along with
# this library. Look for the file license.txt at the root level. If you do not
# find it, write to the Free Software Foundation, Inc., 59 Temple Place,
# Suite 330, Boston, MA 02111-1307 USA.

delete from speaker;
delete from event_session;
delete from attendee;
delete from event_sponsor;
delete from event;

delete from representative;
delete from partner;

delete from article;
delete from web_source;
delete from mailing_list_message;
delete from topic;
delete from mailing_list_subscription;
delete from mailing_list;

delete from user_group;
delete from access_group;
delete from authentication;

delete from historical_message;
delete from user_account;
delete from city;
delete from province;
delete from country;
delete from language;
delete from message_template;
delete from application_property;

insert into application_property values ('timezone', 'UTC 0:00'),
                                        ('url', 'http://localhost:8080/jug'),
                                        ('sendEmails', 'false'),
                                        ('groupName', 'UG'),
                                        ('language', 'en'),
                                        ('emailServerType', 'pop3');

insert into message_template (id, title, body) values
    ('03BD6F3ACE4C48BD8660411FC8673DB4', '[UG] Registration Deactivated', '<p>Dear <b>#{userAccount.firstName}</b>,</p><p>We are very sorry to inform that we cannot keep you as a UG member.</p><p>Reason: <i>#{userAccount.deactivationReason}</i></p><p>We kindly appologize for the inconvenience and we count on your understanding.</p><p>Best Regards,</p><p><b>UG Leadership Team</b></p>'),
    ('0D6F96382D91454F8155A720F3326F1B', '[UG Admin] A New Member Joint the Group', '<p>Dear UG Leader,</p><p><b>#{userAccount.fullName}</b> joint the UG at #{userAccount.registrationDate}.</p><p>Regards,</p><p><b>UG Management</b></p>'),
    ('47DEE5C2E0E14F8BA4605F3126FBFAF4', '[UG] Welcome to UG', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>you are confirmed as a member of the UG. Welcome to the <b><a href=''http://www.cejug.org''>UG Community</a></b>!</p><p>Thank you!</p><p><b>UG Leadership Team</b></p>'),
    ('67BE6BEBE45945D29109A8D6CD878344', '[UG] Request for Password Change', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>you requested to change your password. The authorization code to perform this operation is:</p><p>#{userAccount.confirmationCode}</p><p>Inform this code in the form that you saw right after requesting the new password or just follow the link below to fill out the form automatically:</p><p><a href=''http://#{serverAddress}/change_password.xhtml?cc=#{userAccount.confirmationCode}''>http://#{serverAddress}/change_password.xhtml?cc=#{userAccount.confirmationCode}</a></p><p>Thank you!<br/>\r\n\r\n<b>UG Leadership Team</b></p>'),
    ('KJZISKQBE45945D29109A8D6C92IZJ89', '[UG] Request for Email Change', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>you requested to change your email address from <i>#{userAccount.email}</i> to <i>#{userAccount.unverifiedEmail}</i>. The authorization code to perform this operation is:</p><p>#{userAccount.confirmationCode}</p><p>Inform this code in the form that you saw right after changing the email address or just follow the link below:</p><p><a href=''http://#{serverAddress}/change_email_confirmation.xhtml?cc=#{userAccount.confirmationCode}''>http://#{serverAddress}/change_email_confirmation.xhtml?cc=#{userAccount.confirmationCode}</a></p><p>Thank you!<br/>\r\n\r\n<b>UG Leadership Team</b></p>'),
    ('E3F122DCC87D42248872878412B34CEE', '[UG] Registration Confirmation', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>you seems to register yourself as a member of UG. We would like to confirm your email address to be able to contact you when necessary. You just have to click on the link below to confirm your email:</p><p><a href=''http://#{serverAddress}/EmailConfirmation?code=#{userAccount.confirmationCode}''>http://#{serverAddress}/EmailConfirmation?code=#{userAccount.confirmationCode}</a></p><p>If the address above does not look like a link, please select, copy and paste it your web browser. If you do not registered on UG and beleave that this message was sent by mistake, please ignore it and accept our apologes.</p><p>Best Regards,</p><p><b>UG Leadership Team</b></p>'),
    ('IKWMAJSNDOE3F122DCC87D4224887287', '[UG] Membership Deactivated', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>we just knew that you wanna leave us :( Thank you for all contributions you have made to the UG community.</p><p>All the best,</p><p><b>UG Leadership Team</b></p>'),
    ('0D6F96382IKEJSUIWOK5A720F3326F1B', '[UG Admin] A Member Was Deactivated', '<p>Dear UG Leader,</p><p><b>#{userAccount.fullName}</b> was deactivated from the UG due to the following reason:</p><p><i>#{userAccount.deactivationReason}</i></p><p>Regards,</p><p><b>UG Management</b></p>'),
    ('09JDIIE82O39IDIDOSJCHXUDJJXHCKP0', '[UG Admin] Group Assigment', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>You were assigned to the <b>#{accessGroup.name}</b> group. Changes on your rights may apply.</p><p>Regards,</p><p><b>UG Management</b></p> '),
    ('KJDIEJKHFHSDJDUWJHAJSNFNFJHDJSLE', '[UG] Event Attendance', '<p>Hi <b>#{userAccount.firstName}</b>,</p><p>you have confirmed your attendance in the event <b>#{event.name}</b> that will take place at <b>#{event.venue}</b>, on <b>#{event.startDate}</b>, from <b>#{event.startTime}</b> to <b>#{event.endTime}</b>.</p><p>We are looking forward to see you there!</p><p>Best Regards,</p><p><b>UG Leadership Team</b></p>');

insert into message_template (id, title, body) values
    ('03BD6F3ACE4C48BR8660411FC8673DB4', '[CEJUG] Cancelamento de Registro', '<p>Caro(a) <b>#{userAccount.firstName}</b>,</p>\r\n<p>sentimos muito em informar que não poderemos manter o seu registro como membro do CEJUG.</p>\r\n<p>Motivo: <i>#{userAccount.deactivationReason}</i></p>\r\n<p>Pedimos desculpas pelo transtorno e contamos com a vossa compreensão.</p>\r\n<p>Atenciosamente,</p>\r\n<p><b>Coordenação do CEJUG</b></p>'),
    ('0D6F96382D91454H8155A720F3326F1B', '[CEJUG Admin] Um novo membro cadastrou-se no grupo', '<p>Caro Coordenador do CEJUG,</p>\r\n<p><b>#{newMember.fullName}</b> registrou-se como novo membro do CEJUG em #{newMember.registrationDate}.</p>\r\n<p>Atenciosamente,</p>\r\n<p><b>Sistema de Administração do CEJUG</b></p>'),
    ('47DEE5C2E0E14F8WA4605F3126FBFAF4', '[CEJUG] Bem vindo ao CEJUG', '<p>Oi <b>#{userAccount.firstName}</b>,</p>\r\n<p>seu registro foi confirmado com sucesso. Seja bem vindo ao <b><a href=''http://www.cejug.org''>CEJUG</a></b>!</p>\r\n<p>Para tratar de assuntos administrativos, como se registrar ou sair das listas de discussão, patrocinar o grupo ou compartilhar notícias, favor entrar em contato através do email admin@cejug.org.</p>\r\n<p>Atenciosamente,</p>\r\n<p><b>Coordenação do CEJUG</b></p>'),
    ('67BE6BEBE45945DF9109A8D6CD878344', '[CEJUG] Mudança de Senha', '<p>Oi <b>#{userAccount.firstName}</b>,</p>\r\n<p>você solicitou a mudança da sua senha do CEJUG. O código de autorização para mudar sua senha é:</p>\r\n<p>#{userAccount.confirmationCode}</p>\r\n<p>Informe este código no formulário de mudança de senha ou siga o endereço abaixo para preencher o campo automaticamente:</p>\r\n<p><a href=''http://#{serverAddress}/change_password.xhtml?cc=#{userAccount.confirmationCode}''>http://#{serverAddress}/change_password.xhtml?cc=#{userAccount.confirmationCode}</a></p>\r\n<p>Atenciosamente,<br/>\r\n<b>Coordenação do CEJUG</b></p>'),
    ('KJZISKQBE45945D291H9A8D6C92IZJ89', '[CEJUG] Solicitação de mudança de email', '<p>Oi <b>#{userAccount.firstName}</b>,</p><p>você solicitou a mudança do seu endereço de email de <i>#{userAccount.email}</i> para <i>#{userAccount.unverifiedEmail}</i>. O código de autorização para realizar esta operação é:</p><p>#{userAccount.confirmationCode}</p><p>Informe este código no campo que apareceu logo após a mudança de email ou apenas siga o link abaixo:</p><p><a href=''http://#{serverAddress}/change_email_confirmation.xhtml?cc=#{userAccount.confirmationCode}''>http://#{serverAddress}/change_email_confirmation.xhtml?cc=#{userAccount.confirmationCode}</a></p><p>Obrigado!<br/>\r\n\r\n<b>Coordenação do CEJUG</b></p>'),
    ('E3F122DCC87D422488M2878412B34CEE', '[CEJUG] Confirmação de Email', '<p>Oi <b>#{userAccount.firstName}</b>,</p>\r\n<p>você parece ter se registrado como membro no CEJUG. Nós gostariamos de confirmar o seu endereço de email para podermos entrar em contato sempre que necessário. Você só precisa clicar no link abaixo para confirmar o seu registro no CEJUG:</p>\r\n<p><a href=''http://#{serverAddress}/EmailConfirmation?code=#{userAccount.confirmationCode}''>http://#{serverAddress}/EmailConfirmation?code=#{userAccount.confirmationCode}</a></p>\r\n<p>Se o endereço acima não aparecer como link no seu cliente de email, selecione, copie e cole o endereço no seu navegador web. Se você não se registrou no CEJUG e acredita se tratar de um engano, por favor ignore esta mensagem e aceite nossas desculpas.</p>\r\n<p>Atenciosamente,</p>\r\n<p><b>Coordenação do CEJUG</b></p>'),
    ('IKWMAJSNDOE3F122DCA87D4224887287', '[CEJUG] Afiliação ao CEJUG Desativada', '<p>Oi <b>#{userAccount.firstName}</b>,</p>\r\n<p>nós acabamos de saber que você vai nos deixar :( Muito obrigado por todas as contribuições que você fez ao CEJUG. Crescemos juntos durante o período em que você esteve conosco.</p>\r\n<p>Desejamos o melhor,</p>\r\n<p><b>Coordenação do CEJUG</b></p>'),
    ('0D6F96382IKEJSUIWO25A720F3326F1B', '[CEJUG Admin] Um Membro foi Desativado', '<p>Caro JUG Leader,</p>\r\n<p><b>#{userAccount.fullName}</b> foi desativado do grupo devido a seguinte razão:</p>\r\n<p><i>#{userAccount.deactivationReason}</i></p>\r\n<p>Atenciosamente,</p>\r\n<p><b>Sistema de Administração do CEJUG</b></p>'),
    ('09JDIIE82O39IDIDOS5CHXUDJJXHCKP0', '[CEJUG Admin] Você foi adicionado a um grupo do CEJUG', '<p>Oi <b>#{userAccount.firstName}</b>,</p><p>Você foi adicionado ao grupo <b>#{accessGroup.name}</b>. Mudanças nas suas permissões de acesso devem ocorrer.</p><p>Atenciosamente,</p><p><b>Sistema de Administração do CEJUG</b></p>'),
    ('KJDIEJKHFHSDJDUWJH7JSNFNFJHDJSLE', '[CEJUG] Confirmação de Comparecimento ao Evento', '<p>Oi <b>#{userAccount.firstName}</b>,</p><p>esta mensagem é só para informá-lo(a) que você acabou de confirmar seu comparecimento ao evento <b>#{event.name}</b>, que vai acontecer no(a) <b>#{event.venue}</b>, no dia <b>#{event.startDate}</b>, das <b>#{event.startTime}</b> até as <b>#{event.endTime}</b>.</p><p>Esperamos você lá!</p><p>Atenciosamente,</p><p><b>Coordenação do CEJUG</b></p>');

insert into language values ('en', 'English');
insert into language values ('pt', 'Portugues');

insert into access_group (id, name, description, user_default) values
    ('PQOWKSIFUSLEOSJFNMDKELSOEJDKNWJE', 'helpers', 'Helpers', 0),
    ('IKSJDKMSNDJUEIKWQJSHDNCMXKLOPIKJ', 'partners', 'Partners', 0);
