import React, { Component, Fragment } from 'react';
import { connect } from 'react-redux';
import {
  PageSectionVariants,
  Toolbar,
  ToolbarGroup,
  ToolbarItem,
  Button
} from '@patternfly/react-core';

import { fetchHostsAsync } from '../actions/hosts';
import { getHostTableRows, getHostsLoading } from '../selectors/hosts';
import { RootState } from '../store/rootReducer';
import PageSection from './ui/PageSection';
import HostsTable from './HostsTable';

interface Props {
  hostRows: string[][];
  loading: boolean;
  fetchHosts: () => void;
}

class BaremetalInventory extends Component<Props> {
  componentDidMount(): void {
    this.props.fetchHosts();
  }

  render(): JSX.Element {
    const { hostRows } = this.props;
    return (
      <Fragment>
        <PageSection variant={PageSectionVariants.darker}>
          Summary stats
        </PageSection>
        <PageSection variant={PageSectionVariants.light}>
          <Toolbar>
            <ToolbarGroup>
              <ToolbarItem>
                <Button variant="primary">Add Hosts</Button>
              </ToolbarItem>
            </ToolbarGroup>
          </Toolbar>
        </PageSection>
        <PageSection
          variant={PageSectionVariants.light}
          isMain
          style={{ padding: 0 }}
        >
          <HostsTable hostRows={hostRows} />
        </PageSection>
      </Fragment>
    );
  }
}

const mapStateToProps = (
  state: RootState
): { hostRows: string[][]; loading: boolean } => ({
  hostRows: getHostTableRows(state.hosts),
  loading: getHostsLoading(state.hosts)
});

export default connect(
  mapStateToProps,
  { fetchHosts: fetchHostsAsync }
)(BaremetalInventory);
