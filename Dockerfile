FROM lergo/lergo-build-setup:latest

ARG workdir=/app/lergo
WORKDIR ${workdir}

RUN git clone https://github.com/lergo/lergo-ri.git
# RUN git clone https://github.com/lergo/lergo-ui.git
# RUN git clone https://github.com/lergo/lergo-protractor-tests.git

COPY scripts/install_ri.sh ${workdir}/staging-promote-upgrade/scripts/install_ri.sh
RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/install_ri.sh

# COPY scripts/build_ri.sh ${workdir}/staging-promote-upgrade/scripts/build_ri.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/build_ri.sh

# COPY scripts/install_ui.sh ${workdir}/staging-promote-upgrade/scripts/install_ui.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/install_ui.sh

# COPY scripts/build_ui.sh ${workdir}/staging-promote-upgrade/scripts/build_ui.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/build_ui.sh

# COPY scripts/build_system_tests.sh ${workdir}/staging-promote-upgrade/scripts/build_system_tests.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/build_system_tests.sh

# COPY scripts/install_tasks.sh ${workdir}/staging-promote-upgrade/scripts/install_tasks.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/install_tasks.sh


# COPY scripts/upload_artifacts.sh ${workdir}/staging-promote-upgrade/scripts/upload_artifacts.sh
# RUN /bin/bash -c ${workdir}/staging-promote-upgrade/scripts/upload_artifacts.sh

# RUN /bin/bash -c 'source ~/.nvm/nvm.sh && cd lergo-ri && nvm use && ./node_modules/.bin/grunt testBefore'
# && source ~/.nvm/nvm.sh && nvm install && npm install"

# COPY scripts ${workdir}/staging-promote-upgrade/scripts
# RUN bash -c /app/lergo/staging-promote-upgrade/scripts/build_ri.sh
# RUN bash -c /app/lergo/staging-promote-upgrade/scripts/build_ui.sh
# RUN bash -c /app/lergo/staging-promote-upgrade/scripts/build_system_tests.sh
COPY . ${workdir}/staging-promote-upgrade
