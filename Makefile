REMOTE_USER=yapcna
REMOTE_HOST=spectre.mongueurs.net
REMOTE_ROOT_TEST=yn2016-test
REMOTE_ROOT_REPO=yn2016
RSYNC=$(shell which rsync)
RSYNC_ARGS=-avz --delete --exclude '.git' --exclude '*.swp' --exclude '.DS_Store' --exclude 'less' --exclude 'Icon' --exclude config.codekit --exclude 'codekit-cache'

SSH=$(shell which ssh)
GIT=$(shell which git)

pull:
	$(RSYNC) $(RSYNC_ARGS) $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/wwwdocs/ wwwdocs/
	$(RSYNC) $(RSYNC_ARGS) $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/actdocs/ actdocs/

push:
	$(RSYNC) $(RSYNC_ARGS) wwwdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/wwwdocs/
	$(RSYNC) $(RSYNC_ARGS) actdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/actdocs/

